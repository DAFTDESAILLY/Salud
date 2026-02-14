import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daftfits/features/nutrition/models/meal.dart';
import 'package:daftfits/features/nutrition/models/food_item.dart';
import 'package:daftfits/features/nutrition/screens/food_database_screen.dart';
import 'package:daftfits/features/nutrition/providers/meal_providers.dart';
import 'package:daftfits/features/hydration/providers/hydration_providers.dart';

// Helper class for local state
class _FoodEntry {
  final String foodId;
  final String foodName;
  final double portionGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;

  _FoodEntry({
    required this.foodId,
    required this.foodName,
    required this.portionGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });
}

class MealLogScreen extends ConsumerStatefulWidget {
  final Meal? existingMeal; // null for new meal

  const MealLogScreen({super.key, this.existingMeal});

  @override
  ConsumerState<MealLogScreen> createState() => _MealLogScreenState();
}

class _MealLogScreenState extends ConsumerState<MealLogScreen> {
  late String _selectedMealType;
  final List<_FoodEntry> _foodEntries = [];
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.existingMeal != null) {
      // Load existing meal data
      _selectedMealType = widget.existingMeal!.mealType;
      // Note: In a real app we might need to fetch food details to get accurate per-entry macros
      // For now we will assume we need to re-fetch or calc them.
      // Since existingMeal stores denormalized names and portions, we can start with that,
      // but to get macros we'd ideally query the FoodItems.
      // Simplified for this implementation:
      _notesController.text = widget.existingMeal!.notes ?? '';
    } else {
      // Auto-select type based on time
      final now = DateTime.now();
      if (now.hour < 11) {
        _selectedMealType = 'breakfast';
      } else if (now.hour < 16) {
        _selectedMealType = 'lunch';
      } else if (now.hour < 20) {
        _selectedMealType = 'dinner';
      } else {
        _selectedMealType = 'snack';
      }
    }
  }

  void _addFoodItem() async {
    final selectedFood = await Navigator.push<FoodItem>(
      context,
      MaterialPageRoute(
        builder: (_) => const FoodDatabaseScreen(),
      ),
    );

    if (selectedFood != null) {
      if (!mounted) return;

      final portion = await _showPortionDialog(selectedFood);
      if (portion != null && portion > 0) {
        setState(() {
          final factor = portion / 100;
          _foodEntries.add(_FoodEntry(
            foodId: selectedFood.foodId,
            foodName: selectedFood.name,
            portionGrams: portion,
            calories: selectedFood.caloriesPer100g * factor,
            protein: selectedFood.proteinPer100g * factor,
            carbs: selectedFood.carbsPer100g * factor,
            fats: selectedFood.fatsPer100g * factor,
          ));
        });
      }
    }
  }

  Future<double?> _showPortionDialog(FoodItem food) async {
    final controller = TextEditingController(
      text: (food.servingSizeGrams ?? 100).toString(),
    );

    return showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Cantidad de ${food.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Gramos',
                suffixText: 'g',
                border: OutlineInputBorder(),
              ),
            ),
            if (food.servingUnit != null) ...[
              const SizedBox(height: 8),
              Text(
                'Referencia: 1 ${food.servingUnit} ≈ ${food.servingSizeGrams}g',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              final value = double.tryParse(controller.text);
              Navigator.pop(context, value);
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveMeal() async {
    if (_foodEntries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agrega al menos un alimento')),
      );
      return;
    }

    final isar = await ref.read(isarProvider.future);

    // Calculate totals
    double totalCals = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFats = 0;

    for (var entry in _foodEntries) {
      totalCals += entry.calories;
      totalProtein += entry.protein;
      totalCarbs += entry.carbs;
      totalFats += entry.fats;
    }

    final meal = Meal()
      ..timestamp = widget.existingMeal?.timestamp ?? DateTime.now()
      ..mealType = _selectedMealType
      ..foodItemIds = _foodEntries.map((e) => e.foodId).toList()
      ..foodItemNames = _foodEntries.map((e) => e.foodName).toList()
      ..portionSizesGrams = _foodEntries.map((e) => e.portionGrams).toList()
      ..totalCalories = totalCals
      ..totalProtein = totalProtein
      ..totalCarbs = totalCarbs
      ..totalFats = totalFats
      ..notes = _notesController.text.isEmpty ? null : _notesController.text
      ..createdAt = widget.existingMeal?.createdAt ?? DateTime.now();

    await isar.writeTxn(() async {
      await isar.meals.put(meal);
    });

    // Invalidate provider to refresh home screen
    ref.invalidate(todayMealsProvider);
    ref.invalidate(todayNutritionSummaryProvider);

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comida guardada exitosamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate live summary
    double summaryCals = 0;
    double summaryProt = 0;
    double summaryCarbs = 0;
    double summaryFats = 0;

    for (var e in _foodEntries) {
      summaryCals += e.calories;
      summaryProt += e.protein;
      summaryCarbs += e.carbs;
      summaryFats += e.fats;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.existingMeal == null ? 'Registrar Comida' : 'Editar Comida'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Meal Type Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedMealType,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de comida',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: 'breakfast', child: Text('☀️ Desayuno')),
                    DropdownMenuItem(
                        value: 'lunch', child: Text('🌞 Almuerzo')),
                    DropdownMenuItem(value: 'dinner', child: Text('🌙 Cena')),
                    DropdownMenuItem(value: 'snack', child: Text('🍿 Snack')),
                  ],
                  onChanged: (value) =>
                      setState(() => _selectedMealType = value!),
                ),

                const SizedBox(height: 24),

                // Food List
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alimentos (${_foodEntries.length})',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton.icon(
                      onPressed: _addFoodItem,
                      icon: const Icon(Icons.add),
                      label: const Text('Agregar'),
                    ),
                  ],
                ),

                if (_foodEntries.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(32),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: const [
                        Icon(Icons.restaurant, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('No has agregado alimentos',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  )
                else
                  ..._foodEntries.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title: Text(item.foodName),
                        subtitle: Text(
                            '${item.portionGrams.round()}g · ${item.calories.round()} kcal'),
                        trailing: IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _foodEntries.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  }),

                const SizedBox(height: 24),

                // Notes
                TextField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notas (opcional)',
                    hintText: '¿Cómo te sentiste? ¿Con quién comiste?',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),

          // Bottom Summary Panel
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMiniStat('Calorías', '${summaryCals.round()}', ''),
                      _buildMiniStat('Prot', '${summaryProt.round()}', 'g'),
                      _buildMiniStat('Carbs', '${summaryCarbs.round()}', 'g'),
                      _buildMiniStat('Grasas', '${summaryFats.round()}', 'g'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: _saveMeal,
                      child: const Text('Guardar Comida'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(String label, String value, String unit) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text('$value$unit',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}
