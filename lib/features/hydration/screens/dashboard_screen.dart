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

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  // Logic for adding water with custom amount
  void _showAddWaterDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agregar Agua'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Cantidad ml',
            suffixText: 'ml',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              final amount = int.tryParse(controller.text);
              if (amount != null && amount > 0) {
                _addWater(ref, amount);
                Navigator.pop(context);
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  Future<void> _addWater(WidgetRef ref, int amount) async {
    final isar = await ref.read(isarProvider.future);
    final log = HydrationLog()
      ..amountMl = amount
      ..timestamp = DateTime.now();

    await isar.writeTxn(() async {
      await isar.hydrationLogs.put(log);
    });

    // Need to trigger provider refresh if they are streams?
    // StreamProviders update automatically when Isar fires change events.
    // HydrationScheduler logic:
    final profile = await ref.read(userProfileProvider.future);
    if (profile != null) {
      final calculator = HydrationCalculatorService();
      final goal = calculator.calculateDailyGoal(profile);

      // Wait a tiny bit for Riverpod to re-calc intake or calculate manually?
      // Best to calculate manually for instant feedback in scheduler
      final currentTotal = ref.read(todayTotalIntakeProvider);
      // Note: this provider might be stale.
      // But passing old + new is fine.

      final scheduler = ref.read(hydrationSchedulerProvider);
      await scheduler.scheduleDailyReminders(
          profile, goal, (currentTotal + amount).toInt());
    }
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
          onPressed: () => _showAddWaterDialog(context, ref),
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
