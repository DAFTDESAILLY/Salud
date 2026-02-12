import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/features/hydration/widgets/animated_circular_progress.dart';
import 'package:agua/features/hydration/widgets/dashboard_widgets.dart';
import 'package:agua/features/hydration/widgets/quick_add_capsule.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';
import 'package:agua/features/hydration/services/hydration_calculator_service.dart';
import 'package:agua/features/hydration/models/hydration_log.dart';
import 'package:agua/features/hydration/screens/history_screen.dart';
import 'package:agua/features/hydration/screens/settings_screen.dart';

import 'package:agua/features/hydration/widgets/beverage_selection_sheet.dart';
import 'package:agua/features/hydration/widgets/size_selection_sheet.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  // Logic for adding water with custom amount
  void _showSmartEntry(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BeverageSelectionSheet(
        onSelected: (type, coeff) {
          Navigator.pop(context); // Close beverage sheet
          _showSizeSelector(context, type, coeff);
        },
      ),
    );
  }

  void _showSizeSelector(BuildContext context, String type, double coeff) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SizeSelectionSheet(
        beverageType: type,
        onConfirmed: (amount) {
          Navigator.pop(context); // Close size sheet
          _addLog(ref, amount, type, coeff);
        },
      ),
    );
  }

  Future<void> _addLog(
      WidgetRef ref, int amount, String type, double coeff) async {
    final effective = (amount * coeff).toInt();
    final isar = await ref.read(isarProvider.future);

    final log = HydrationLog()
      ..amountMl = amount
      ..effectiveAmountMl = effective
      ..beverageType = type
      ..timestamp = DateTime.now();

    await isar.writeTxn(() async {
      await isar.hydrationLogs.put(log);
    });

    final profile = await ref.read(userProfileProvider.future);
    if (profile != null) {
      final calculator = HydrationCalculatorService();
      final goal = calculator.calculateDailyGoal(profile);

      // Best to calculate manually for instant feedback in scheduler
      // We need to fetch the accumulated effective amount for today.
      // Since the provider might be async stream, let's calc manually or use current value + new effective.
      final currentTotal = ref.read(
          todayTotalIntakeProvider); // This is likely stale or Stream based.

      // Let's assume currentTotal is up to date enough OR we just add our local effective to it.
      // Actually ref.read(provider) on a StreamProvider returns AsyncValue.
      // But I defined todayTotalIntakeProvider as a Provider<double> which watches a StreamProvider.
      // So reading it gives the *last emitted value*.

      await ref.read(hydrationSchedulerProvider).scheduleDailyReminders(
          profile, goal, (currentTotal + effective).toInt());
    }
  }

  // Quick add (default water)
  Future<void> _addWater(WidgetRef ref, int amount) async {
    await _addLog(ref, amount, 'water', 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final totalMl = ref.watch(todayTotalIntakeProvider);
    final goalAsync = ref.watch(dailyGoalProvider);
    final progress = ref.watch(hydrationProgressProvider);
    final streakAsync = ref.watch(streakProvider);
    final theme = Theme.of(context);

    // Goal Value
    final goal = goalAsync.value ?? 2000;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Agua',
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.history_rounded),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HistoryScreen())),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings_rounded),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SettingsScreen())),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),

                      // Progress Circle
                      AnimatedCircularProgress(
                        percentage: progress,
                        size: 280,
                        color: theme
                            .colorScheme.primary, // Azul eléctrico from theme
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${(progress * 100).toInt()}%',
                              style: theme.textTheme.displayLarge?.copyWith(
                                fontSize: 56,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${totalMl.toInt()} / $goal ml',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.textTheme.bodyMedium?.color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Motivation & Streak
                      MotivationText(percentage: progress),
                      const SizedBox(height: 16),
                      streakAsync.when(
                        data: (streak) => StreakDisplay(days: streak),
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),

                      const SizedBox(height: 48),

                      // Quick Add Capsules
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          QuickAddCapsule(
                              amountMl: 250, onTap: () => _addWater(ref, 250)),
                          const SizedBox(width: 16),
                          QuickAddCapsule(
                              amountMl: 500, onTap: () => _addWater(ref, 500)),
                          const SizedBox(width: 16),
                          QuickAddCapsule(
                              amountMl: 750, onTap: () => _addWater(ref, 750)),
                        ],
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          onPressed: () => _showSmartEntry(context),
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_rounded, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
