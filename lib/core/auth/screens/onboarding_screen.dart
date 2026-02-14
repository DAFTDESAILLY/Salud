import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daftfits/core/theme/app_colors.dart';
import 'package:daftfits/core/auth/models/user_profile.dart';
import 'package:daftfits/core/auth/providers/auth_providers.dart'; // Import this!

// Simple provider to manage local state of onboarding if needed,
// or just use Stateful widget. Stateful is fine here.

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _nameController = TextEditingController();
  final Set<String> _selectedModules = {
    'hydration',
    'fitness',
    'nutrition'
  }; // All selected by default

  Future<void> _finishOnboarding() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa tu nombre')),
      );
      return;
    }

    final isar = await ref.read(isarProvider.future);

    // Create or update profile
    final profile = UserProfile()
      ..name = _nameController.text.trim()
      ..enabledModules = _selectedModules.toList()
      ..hasCompletedOnboarding = true
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
    // .. usesMetricSystem = true (default)

    await isar.writeTxn(() async {
      await isar.userProfiles.put(profile);
    });

    // Navigate to Home (handled by main app logic watching userProfile)
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                'Bienvenido a\nSuperApp Salud',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.waterPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tu centro de control personal para hidratación, fitness y nutrición.',
                style: theme.textTheme.bodyLarge,
              ),
              const Spacer(),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '¿Cómo te llamas?',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 32),
              Text('Elige tus objetivos:', style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
              _ModuleToggle(
                title: 'Hidratación',
                icon: Icons.water_drop,
                color: AppColors.waterPrimary,
                isSelected: _selectedModules.contains('hydration'),
                onToggle: (val) => setState(() {
                  val
                      ? _selectedModules.add('hydration')
                      : _selectedModules.remove('hydration');
                }),
              ),
              _ModuleToggle(
                title: 'Fitness',
                icon: Icons.fitness_center,
                color: AppColors.fitnessPrimary,
                isSelected: _selectedModules.contains('fitness'),
                onToggle: (val) => setState(() {
                  val
                      ? _selectedModules.add('fitness')
                      : _selectedModules.remove('fitness');
                }),
              ),
              _ModuleToggle(
                title: 'Nutrición',
                icon: Icons.restaurant,
                color: AppColors.nutritionPrimary,
                isSelected: _selectedModules.contains('nutrition'),
                onToggle: (val) => setState(() {
                  val
                      ? _selectedModules.add('nutrition')
                      : _selectedModules.remove('nutrition');
                }),
              ),
              const Spacer(),
              FilledButton(
                onPressed:
                    _selectedModules.isNotEmpty ? _finishOnboarding : null,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.waterPrimary,
                ),
                child: const Text('COMENZAR'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModuleToggle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final Function(bool) onToggle;

  const _ModuleToggle({
    required this.title,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected ? BorderSide(color: color, width: 2) : BorderSide.none,
      ),
      child: CheckboxListTile(
        value: isSelected,
        onChanged: (v) => onToggle(v ?? false),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        secondary: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        activeColor: color,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
