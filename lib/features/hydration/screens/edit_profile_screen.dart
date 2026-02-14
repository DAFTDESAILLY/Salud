import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daftfits/core/auth/models/user_profile.dart';
import 'package:daftfits/features/hydration/providers/hydration_providers.dart';
import 'package:daftfits/features/hydration/services/hydration_calculator_service.dart';
import 'package:daftfits/features/hydration/models/daily_hydration_goal.dart';
import 'package:isar/isar.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final UserProfile profile;

  const EditProfileScreen({super.key, required this.profile});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late int _age;
  late String _sex;
  late double _weight;
  late ActivityLevel _activityLevel;
  late double _exerciseHours;
  late bool _usesCreatine;

  @override
  void initState() {
    super.initState();
    _name = widget.profile.name;
    _age = widget.profile.age;

    // Safety check for sex dropdown value
    const validSexValues = ['male', 'female'];
    if (validSexValues.contains(widget.profile.sex)) {
      _sex = widget.profile.sex;
    } else {
      _sex = 'male'; // Default fallback
    }

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
        ..name = _name
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
        final today = DateTime.now();
        final todayMidnight = DateTime(today.year, today.month, today.day);

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
      appBar: AppBar(title: const Text('Editar Perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Información Personal'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _name,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (v) => (v == null || v.isEmpty)
                            ? 'Ingresa tu nombre'
                            : null,
                        onSaved: (v) => _name = v ?? 'Usuario',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: _age.toString(),
                              decoration: const InputDecoration(
                                  labelText: 'Edad',
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              validator: (v) =>
                                  (v == null || int.tryParse(v) == null)
                                      ? 'Inválido'
                                      : null,
                              onSaved: (v) => _age = int.parse(v!),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _sex,
                              decoration: const InputDecoration(
                                  labelText: 'Sexo',
                                  border: OutlineInputBorder()),
                              items: const [
                                DropdownMenuItem(
                                    value: 'male', child: Text('Masculino')),
                                DropdownMenuItem(
                                    value: 'female', child: Text('Femenino')),
                              ],
                              onChanged: (v) => setState(() => _sex = v!),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Datos Físicos & Actividad'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _weight.toString(),
                        decoration: const InputDecoration(
                            labelText: 'Peso (kg)',
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        validator: (v) =>
                            (v == null || double.tryParse(v) == null)
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
                              value: ActivityLevel.moderate,
                              child: Text('Moderado')),
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
                        validator: (v) =>
                            (v == null || double.tryParse(v) == null)
                                ? 'Inválido'
                                : null,
                        onSaved: (v) => _exerciseHours = double.parse(v!),
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('¿Usas Creatina?'),
                        value: _usesCreatine,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (v) => setState(() => _usesCreatine = v),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _saveChanges,
                  icon: const Icon(Icons.save_rounded),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Guardar y Recalcular Meta'),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
