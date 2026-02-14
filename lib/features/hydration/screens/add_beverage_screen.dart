import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daftfits/features/hydration/models/beverage_config.dart';
import 'package:daftfits/features/hydration/providers/hydration_providers.dart';
import 'package:daftfits/features/hydration/providers/beverage_providers.dart';

class AddBeverageScreen extends ConsumerStatefulWidget {
  const AddBeverageScreen({super.key});

  @override
  ConsumerState<AddBeverageScreen> createState() => _AddBeverageScreenState();
}

class _AddBeverageScreenState extends ConsumerState<AddBeverageScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _sizesController = TextEditingController(); // Comma separated

  double _coefficient = 1.0;
  int _selectedColorValue = Colors.blue.value;
  int _selectedIconCode = Icons.local_drink.codePoint;

  final List<Color> _colors = [
    Colors.blue,
    Colors.brown,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.red,
    Colors.teal,
    Colors.indigo,
    Colors.amber,
  ];

  final List<IconData> _icons = [
    Icons.local_drink,
    Icons.coffee,
    Icons.emoji_food_beverage,
    Icons.fastfood,
    Icons.blender,
    Icons.wine_bar,
    Icons.sports_bar,
    Icons.local_bar,
    Icons.local_cafe,
    Icons.water_drop,
    Icons.fitness_center, // Protein shake?
    Icons.eco, // Green juice?
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _sizesController.dispose();
    super.dispose();
  }

  Future<void> _saveBeverage() async {
    if (_formKey.currentState!.validate()) {
      final isar = await ref.read(isarProvider.future);

      // Parse sizes
      List<int>? presetSizes;
      if (_sizesController.text.isNotEmpty) {
        presetSizes = _sizesController.text
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null && e > 0)
            .cast<int>()
            .toList();
      }

      // Create unique ID for type (simplified)
      final typeId = 'custom_${DateTime.now().millisecondsSinceEpoch}';

      final newConfig = BeverageConfig()
        ..type = typeId
        ..name = _nameController.text.trim()
        ..coefficient = _coefficient
        ..colorValue = _selectedColorValue
        ..iconCodePoint = _selectedIconCode
        ..isEnabled = true
        ..presetSizes = presetSizes
        ..updatedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.beverageConfigs.put(newConfig);
      });

      ref.refresh(beverageConfigProvider); // Refresh list

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bebida creada exitosamente')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Crear Nueva Bebida')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la bebida',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un nombre';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Coefficient
            Text(
              'Porcentaje de Hidratación: ${(_coefficient * 100).toInt()}%',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Slider(
              value: _coefficient,
              min: 0.1,
              max: 1.2,
              divisions: 22,
              label: '${(_coefficient * 100).toInt()}%',
              onChanged: (val) => setState(() => _coefficient = val),
            ),
            const SizedBox(height: 24),

            // Color Picker
            Text('Color', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _colors.map((color) {
                final isSelected = color.value == _selectedColorValue;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _selectedColorValue = color.value),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(
                              color: theme.colorScheme.onSurface, width: 3)
                          : null,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Icon Picker
            Text('Icono', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _icons.map((icon) {
                final isSelected = icon.codePoint == _selectedIconCode;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _selectedIconCode = icon.codePoint),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primaryContainer
                          : theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                      border: isSelected
                          ? Border.all(
                              color: theme.colorScheme.primary, width: 2)
                          : null,
                    ),
                    child: Icon(
                      icon,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Preset Sizes
            TextFormField(
              controller: _sizesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tamaños por defecto (ml)',
                hintText: 'ej: 250, 500, 750 (Opcional)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.format_list_numbered),
              ),
            ),

            const SizedBox(height: 32),

            FilledButton.icon(
              onPressed: _saveBeverage,
              icon: const Icon(Icons.save),
              label: const Text('Guardar Bebida'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
