import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/core/theme/responsive_utils.dart';

import 'package:agua/core/auth/models/user_profile.dart';
import '../services/hydration_calculator_service.dart';
import '../providers/hydration_providers.dart';
import '../models/daily_hydration_goal.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form Data
  String _name = '';
  int _age = 25;
  String _sex = 'male';
  double _weight = 70;
  ActivityLevel _activityLevel = ActivityLevel.moderate;
  double _exerciseHours = 1.0;
  bool _usesCreatine = false;

  TimeOfDay _wakeUpTime = const TimeOfDay(hour: 7, minute: 0);
  TimeOfDay _bedTime = const TimeOfDay(hour: 22, minute: 0);

  String _formatTime(TimeOfDay time) {
    if (!mounted)
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

  Future<void> _selectTime(bool isWakeUp) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isWakeUp ? _wakeUpTime : _bedTime,
    );
    if (picked != null) {
      setState(() {
        if (isWakeUp) {
          _wakeUpTime = picked;
        } else {
          _bedTime = picked;
        }
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final profile = UserProfile()
        ..name = _name
        ..age = _age
        ..sex = _sex
        ..weight = _weight
        ..activityLevel = _activityLevel
        ..exerciseHours = _exerciseHours
        ..usesCreatine = _usesCreatine
        ..wakeUpHour = _wakeUpTime.hour
        ..wakeUpMinute = _wakeUpTime.minute
        ..bedTimeHour = _bedTime.hour
        ..bedTimeMinute = _bedTime.minute
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      final calculator = HydrationCalculatorService();
      final goalAmount = calculator.calculateDailyGoal(profile);

      final today = DateTime.now();
      final todayMidnight = DateTime(today.year, today.month, today.day);

      final goal = DailyHydrationGoal()
        ..date = todayMidnight
        ..targetAmountMl = goalAmount;

      final isar = await ref.read(isarProvider.future);

      await isar.writeTxn(() async {
        await isar.userProfiles.put(profile);
        await isar.dailyHydrationGoals.put(goal);
      });

      // Schedule notifications
      final scheduler = ref.read(hydrationSchedulerProvider);
      await scheduler.scheduleDailyReminders(profile, goalAmount, 0);

      // Navigation handled by main.dart stream listener or router
    }
  }

  @override
  Widget build(BuildContext context) {
    // Responsive padding
    final horizontalPadding = context.wp(6).clamp(16.0, 48.0);
    final verticalPadding = context.hp(3).clamp(16.0, 32.0);

    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Configuremos tu perfil de hidratación',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              context.vSpace(3),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                initialValue: _name,
                onSaved: (value) => _name = value ?? 'Usuario',
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Ingresa tu nombre'
                    : null,
              ),
              context.vSpace(2),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Edad (años)'),
                keyboardType: TextInputType.number,
                initialValue: '25',
                onSaved: (value) => _age = int.parse(value!),
                validator: (value) =>
                    (value == null || int.tryParse(value) == null)
                        ? 'Ingresa una edad válida'
                        : null,
              ),
              context.vSpace(2),
              DropdownButtonFormField<String>(
                value: _sex,
                items: const [
                  DropdownMenuItem(value: 'male', child: Text('Masculino')),
                  DropdownMenuItem(value: 'female', child: Text('Femenino')),
                ],
                onChanged: (v) => setState(() => _sex = v!),
                decoration: const InputDecoration(labelText: 'Sexo'),
              ),
              context.vSpace(2),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
                initialValue: '70',
                onSaved: (value) => _weight = double.parse(value!),
              ),
              context.vSpace(2),
              DropdownButtonFormField<ActivityLevel>(
                value: _activityLevel,
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
                decoration:
                    const InputDecoration(labelText: 'Nivel de Actividad'),
              ),
              context.vSpace(2),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Horas Ejercicio (dia)'),
                keyboardType: TextInputType.number,
                initialValue: '0',
                onSaved: (value) => _exerciseHours = double.parse(value!),
              ),
              context.vSpace(2),
              SwitchListTile(
                title: const Text('¿Usas Creatina?'),
                value: _usesCreatine,
                onChanged: (v) => setState(() => _usesCreatine = v),
              ),
              context.vSpace(3),
              const Text('Horarios',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              context.vSpace(2),
              ListTile(
                title: const Text('Hora de despertar'),
                subtitle: Text(_formatTime(_wakeUpTime)),
                trailing: const Icon(Icons.wb_sunny_outlined),
                onTap: () => _selectTime(true),
                tileColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              context.vSpace(1.5),
              ListTile(
                title: const Text('Hora de dormir'),
                subtitle: Text(_formatTime(_bedTime)),
                trailing: const Icon(Icons.bedtime_outlined),
                onTap: () => _selectTime(false),
                tileColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              context.vSpace(4),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _saveProfile,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Comenzar', style: TextStyle(fontSize: 18)),
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
