import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:agua/core/database/isar_service.dart';
import 'package:agua/core/models/user_profile.dart';
import 'package:agua/features/notifications/services/notification_service.dart';
import 'package:agua/features/notifications/services/hydration_scheduler_service.dart';
import '../models/daily_hydration_goal.dart';
import '../models/hydration_log.dart';
import '../models/daily_history_data.dart';

// --- Dependencies ---

final isarServiceProvider = Provider<IsarService>((ref) => IsarService());

final notificationServiceProvider =
    Provider<NotificationService>((ref) => NotificationService());

final hydrationSchedulerProvider = Provider<HydrationSchedulerService>((ref) {
  final notificationService = ref.watch(notificationServiceProvider);
  return HydrationSchedulerService(notificationService);
});

final isarProvider = FutureProvider<Isar>((ref) async {
  final service = ref.watch(isarServiceProvider);
  return await service.db;
});

// --- Profile ---

final userProfileProvider = StreamProvider<UserProfile?>((ref) async* {
  final isar = await ref.watch(isarProvider.future);
  yield* isar.userProfiles
      .where()
      .watch(fireImmediately: true)
      .map((profiles) => profiles.isNotEmpty ? profiles.first : null);
});

// --- Hydration Settings / Goals ---

final dailyGoalProvider = StreamProvider<int>((ref) async* {
  final isar = await ref.watch(isarProvider.future);
  final today = DateTime.now();
  final startOfDay = DateTime(today.year, today.month, today.day);

  // Watch for changes in DailyHydrationGoal for today
  yield* isar.dailyHydrationGoals
      .filter()
      .dateEqualTo(startOfDay)
      .watch(fireImmediately: true)
      .map((goals) {
    if (goals.isNotEmpty) {
      return goals.first.targetAmountMl;
    }
    return 2000; // Fallback default
  });
});

// --- Logs ---

// Start of today (00:00:00)
final todayProvider = Provider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
});

final todayLogsProvider = StreamProvider<List<HydrationLog>>((ref) async* {
  final isar = await ref.watch(isarProvider.future);
  final startOfDay = ref.watch(todayProvider);
  final endOfDay = startOfDay.add(const Duration(days: 1));

  yield* isar.hydrationLogs
      .filter()
      .timestampBetween(startOfDay, endOfDay)
      .sortByTimestampDesc()
      .watch(fireImmediately: true);
});

final todayTotalIntakeProvider = Provider<double>((ref) {
  final logsAsync = ref.watch(todayLogsProvider);
  return logsAsync.when(
    data: (logs) => logs.fold(0, (sum, log) => sum + log.amountMl),
    loading: () => 0,
    error: (_, __) => 0,
  );
});

final hydrationProgressProvider = Provider<double>((ref) {
  final total = ref.watch(todayTotalIntakeProvider);
  final goalAsync = ref.watch(dailyGoalProvider);

  return goalAsync.when(
    data: (goal) => goal > 0 ? (total / goal).clamp(0.0, 2.0) : 0,
    loading: () => 0,
    error: (_, __) => 0,
  );
});
final weeklyHistoryProvider =
    FutureProvider<List<DailyHistoryData>>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final sevenDaysAgo = today.subtract(const Duration(days: 6));

  // 1. Fetch Goals for the range
  final goals = await isar.dailyHydrationGoals
      .filter()
      .dateBetween(sevenDaysAgo, today)
      .findAll();

  // Map Date -> Goal
  final Map<DateTime, int> goalMap = {
    for (var g in goals) g.date: g.targetAmountMl
  };

  // 2. Fetch Logs for the range
  // We need endOfDay for today
  final endOfRange = today.add(const Duration(days: 1));

  final logs = await isar.hydrationLogs
      .filter()
      .timestampBetween(sevenDaysAgo, endOfRange)
      .findAll();

  // 3. Aggregate
  List<DailyHistoryData> history = [];

  for (int i = 0; i < 7; i++) {
    final date = sevenDaysAgo.add(Duration(days: i));

    // Get Goal
    final goal = goalMap[date] ?? 2000; // Fallback? Or maybe 0 if no data?
    // Better to fetch current profile calculation if missing,
    // but for now 2000 or 0 is safe placeholder.
    // Or we could leave it as is.

    // Sum logs for this day
    final startOfDay = date;
    final endOfDay = date.add(const Duration(days: 1));

    final dailyLogs = logs.where((l) =>
        l.timestamp
            .isAfter(startOfDay.subtract(const Duration(milliseconds: 1))) &&
        l.timestamp.isBefore(endOfDay));

    final totalIntake = dailyLogs.fold(0, (sum, log) => sum + log.amountMl);

    history.add(DailyHistoryData(
      date: date,
      intakeMl: totalIntake,
      goalMl: goal,
    ));
  }

  // Return reversed to show newest first? Or oldest first?
  // Lists usually show newest at top.
  return history.reversed.toList();
});

final streakProvider = FutureProvider<int>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  final today = DateTime.now();
  final todayMidnight = DateTime(today.year, today.month, today.day);

  int streak = 0;

  // Check Today first
  // Calculate today's intake and goal
  // We can reuse providers but async inside async is tricky, better direct query for speed/consistency in this block
  final dailyGoal = await isar.dailyHydrationGoals
      .filter()
      .dateEqualTo(todayMidnight)
      .findFirst();
  final target = dailyGoal?.targetAmountMl ?? 2000; // Fallback

  final todayLogs = await isar.hydrationLogs
      .filter()
      .timestampBetween(todayMidnight, today.add(const Duration(days: 1)))
      .findAll();
  final todayIntake = todayLogs.fold(0, (sum, log) => sum + log.amountMl);

  if (todayIntake >= target) {
    streak++;
  }

  // Check backwards from yesterday
  DateTime checkDate = todayMidnight.subtract(const Duration(days: 1));

  while (true) {
    final goal = await isar.dailyHydrationGoals
        .filter()
        .dateEqualTo(checkDate)
        .findFirst();
    // If no goal recorded for that day, maybe we assume default or 0?
    // If user wasn't active, maybe break?
    // Let's assume if no goal exists, streak breaks OR we check valid days.
    // Simple logic: if no goal data, break.
    // OR: use profile current goal if missing? No, historical accuracy.
    if (goal == null) {
      // If we go back far enough to before app install, we break.
      break;
    }

    final dayIntakeLogs = await isar.hydrationLogs
        .filter()
        .timestampBetween(checkDate, checkDate.add(const Duration(days: 1)))
        .findAll();
    final dayIntake = dayIntakeLogs.fold(0, (sum, log) => sum + log.amountMl);

    if (dayIntake >= goal.targetAmountMl) {
      streak++;
      checkDate = checkDate.subtract(const Duration(days: 1));
    } else {
      break;
    }
  }

  return streak;
});
