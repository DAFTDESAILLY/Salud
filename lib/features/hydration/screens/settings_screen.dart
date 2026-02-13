import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/core/models/user_profile.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';
import 'package:agua/features/hydration/services/hydration_calculator_service.dart';
import 'package:agua/features/hydration/screens/edit_profile_screen.dart';
import 'package:agua/features/hydration/screens/beverage_management_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  Future<void> _updateTime(UserProfile profile, bool isWakeUp) async {
    final initialTime = isWakeUp
        ? TimeOfDay(hour: profile.wakeUpHour, minute: profile.wakeUpMinute)
        : TimeOfDay(hour: profile.bedTimeHour, minute: profile.bedTimeMinute);

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      final isar = await ref.read(isarProvider.future);

      // Update fields
      if (isWakeUp) {
        profile.wakeUpHour = picked.hour;
        profile.wakeUpMinute = picked.minute;
      } else {
        profile.bedTimeHour = picked.hour;
        profile.bedTimeMinute = picked.minute;
      }
      profile.updatedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.userProfiles.put(profile);
      });

      // Reschedule
      final calculator = HydrationCalculatorService();
      final goal = calculator
          .calculateDailyGoal(profile); // Recalculate or just get current?
      // Goal doesn't change with time, but we need it for scheduler.
      // Actually scheduler needs daily goal amount.

      // We should ideally fetch the current daily goal from DB or Provider
      // But calculating it from profile is safe if we assume auto-goal.
      // If we support manual goal override later, we'd need to fetch that.
      // For now, re-calc is fine.

      final scheduler = ref.read(hydrationSchedulerProvider);
      // We pass 0 as current intake to force full reschedule?
      // No, we should pass actual current intake.
      final currentIntake = ref.read(todayTotalIntakeProvider);

      await scheduler.scheduleDailyReminders(
          profile, goal, currentIntake.toInt());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Horario actualizado y recordatorios reprogramados.')),
        );
      }
    }
  }

  String _formatTime(int hour, int minute) {
    if (!mounted) return '$hour:$minute';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, hour, minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null)
            return const Center(child: Text('Perfil no encontrado'));
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Mi Perfil'),
                    Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          child: Text(
                            profile.name.isNotEmpty
                                ? profile.name[0].toUpperCase()
                                : 'U',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                          ),
                        ),
                        title: Text(
                          profile.name.isNotEmpty ? profile.name : 'Usuario',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                              '${profile.age} años • ${profile.weight} kg • ${profile.sex == 'male' ? 'H' : 'M'}'),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.edit_outlined),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditProfileScreen(profile: profile),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSectionHeader('Hidratación'),
                    Card(
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.local_drink_rounded,
                              color: Colors.blue),
                        ),
                        title: const Text('Gestionar Bebidas'),
                        subtitle: const Text('Coeficientes y visibilidad'),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BeverageManagementScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSectionHeader('Horarios y Recordatorios'),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.wb_sunny_rounded,
                                  color: Colors.orange),
                            ),
                            title: const Text('Hora de despertar'),
                            subtitle: Text(_formatTime(
                                profile.wakeUpHour, profile.wakeUpMinute)),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () => _updateTime(profile, true),
                          ),
                          Divider(
                              height: 1,
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.1)),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.indigo.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.bedtime_rounded,
                                  color: Colors.indigo),
                            ),
                            title: const Text('Hora de dormir'),
                            subtitle: Text(_formatTime(
                                profile.bedTimeHour, profile.bedTimeMinute)),
                            trailing: const Icon(Icons.chevron_right_rounded),
                            onTap: () => _updateTime(profile, false),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .secondaryContainer
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer
                                .withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Los recordatorios se ajustan automáticamente a tu horario de sueño.',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.color,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
