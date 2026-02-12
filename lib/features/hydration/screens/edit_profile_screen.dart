import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/core/models/user_profile.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';
import 'package:agua/features/hydration/services/hydration_calculator_service.dart';
import 'package:agua/features/hydration/models/daily_hydration_goal.dart';
import 'package:isar/isar.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final UserProfile profile;

  const EditProfileScreen({super.key, required this.profile});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late int _age;
  late String _sex;
  late double _weight;
  late ActivityLevel _activityLevel;
  late double _exerciseHours;
  late bool _usesCreatine;

  @override
  void initState() {
    super.initState();
    _age = widget.profile.age;
    _sex = widget.profile.sex;
    _weight = widget.profile.weight;
    _activityLevel = widget.profile.activityLevel;
    _exerciseHours = widget.profile.exerciseHours;
    _usesCreatine = widget.profile.usesCreatine;
  }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Update local profile object
      final updatedProfile = widget.profile
        ..age = _age
        ..sex = _sex
        ..weight = _weight
        ..activityLevel = _activityLevel
        ..exerciseHours = _exerciseHours
        ..usesCreatine = _usesCreatine
        ..updatedAt = DateTime.now();

      // Recalculate Goal
      final calculator = HydrationCalculatorService();
      final newGoalAmount = calculator.calculateDailyGoal(updatedProfile);

      final isar = await ref.read(isarProvider.future);

      await isar.writeTxn(() async {
        // Save Profile
        await isar.userProfiles.put(updatedProfile);

        // Update Today's Goal
        // We find today's goal and update it, or create if missing.
        final today = DateTime.now();
        final todayMidnight = DateTime(today.year, today.month, today.day);

        // Try to find existing goal for today
        final existingGoal = await isar.dailyHydrationGoals
            .filter()
            .dateEqualTo(todayMidnight)
            .findFirst();

        if (existingGoal != null) {
          existingGoal.targetAmountMl = newGoalAmount;
          await isar.dailyHydrationGoals.put(existingGoal);
        } else {
          final newGoal = DailyHydrationGoal()
            ..date = todayMidnight
            ..targetAmountMl = newGoalAmount;
          await isar.dailyHydrationGoals.put(newGoal);
        }
      });

      // Reschedule Notifications
      final currentIntake = ref.read(todayTotalIntakeProvider);
      final scheduler = ref.read(hydrationSchedulerProvider);
      await scheduler.scheduleDailyReminders(
          updatedProfile, newGoalAmount, currentIntake.toInt());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Perfil actualizado y meta reclaculada.')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Datos Físicos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _age.toString(),
                decoration: const InputDecoration(
                    labelText: 'Edad (años)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    (v == null || int.tryParse(v) == null) ? 'Inválido' : null,
                onSaved: (v) => _age = int.parse(v!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _sex,
                decoration: const InputDecoration(
                    labelText: 'Sexo', border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: 'male', child: Text('Masculino')),
                  DropdownMenuItem(value: 'female', child: Text('Femenino')),
                ],
                onChanged: (v) => setState(() => _sex = v!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _weight.toString(),
                decoration: const InputDecoration(
                    labelText: 'Peso (kg)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || double.tryParse(v) == null)
                    ? 'Inválido'
                    : null,
                onSaved: (v) => _weight = double.parse(v!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<ActivityLevel>(
                value: _activityLevel,
                decoration: const InputDecoration(
                    labelText: 'Nivel de Actividad',
                    border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(
                      value: ActivityLevel.sedentary,
                      child: Text('Sedentario')),
                  DropdownMenuItem(
                      value: ActivityLevel.moderate, child: Text('Moderado')),
                  DropdownMenuItem(
                      value: ActivityLevel.high, child: Text('Alto')),
                ],
                onChanged: (v) => setState(() => _activityLevel = v!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _exerciseHours.toString(),
                decoration: const InputDecoration(
                    labelText: 'Horas Ejercicio (día)',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || double.tryParse(v) == null)
                    ? 'Inválido'
                    : null,
                onSaved: (v) => _exerciseHours = double.parse(v!),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('¿Usas Creatina?'),
                value: _usesCreatine,
                onChanged: (v) => setState(() => _usesCreatine = v),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _saveChanges,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Guardar Cambios'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
