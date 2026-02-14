import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daftfits/features/nutrition/providers/meal_providers.dart';
import 'package:daftfits/features/nutrition/providers/nutrition_providers.dart';
import 'package:daftfits/features/nutrition/widgets/macro_ring_chart.dart';
import 'package:daftfits/features/nutrition/screens/meal_log_screen.dart';
import 'package:daftfits/features/nutrition/models/meal.dart';

class NutritionHome extends ConsumerWidget {
  const NutritionHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayMealsAsync = ref.watch(todayMealsProvider);
    final todayNutritionAsync = ref.watch(todayNutritionSummaryProvider);
    final nutritionGoalAsync = ref.watch(todayNutritionGoalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrición'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement settings screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Macro Chart Section
            if (todayNutritionAsync.hasValue && nutritionGoalAsync.hasValue)
              MacroRingChart(
                currentCalories: todayNutritionAsync.value!.totalCalories,
                goalCalories: nutritionGoalAsync.value!.targetCalories,
                currentProtein: todayNutritionAsync.value!.totalProtein,
                goalProtein: nutritionGoalAsync.value!.targetProteinG,
                currentCarbs: todayNutritionAsync.value!.totalCarbs,
                goalCarbs: nutritionGoalAsync.value!.targetCarbsG,
                currentFats: todayNutritionAsync.value!.totalFats,
                goalFats: nutritionGoalAsync.value!.targetFatsG,
              )
            else
              const Center(child: CircularProgressIndicator()),

            const SizedBox(height: 32),

            // Meals Section
            Text(
              '🍽️ Comidas de hoy',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            todayMealsAsync.when(
              data: (meals) => _buildMealsList(context, meals),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Text('Error al cargar comidas: $err'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MealLogScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Registrar Comida'),
      ),
    );
  }

  Widget _buildMealsList(BuildContext context, List<Meal> meals) {
    if (meals.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(
            'No has registrado comidas hoy.\n¡Empieza ahora!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    // Group meals by type
    final breakfast = meals.where((m) => m.mealType == 'breakfast').toList();
    final lunch = meals.where((m) => m.mealType == 'lunch').toList();
    final dinner = meals.where((m) => m.mealType == 'dinner').toList();
    final snacks = meals.where((m) => m.mealType == 'snack').toList();

    return Column(
      children: [
        if (breakfast.isNotEmpty) _buildMealTypeGroup('☀️ Desayuno', breakfast),
        if (lunch.isNotEmpty) _buildMealTypeGroup('🌞 Almuerzo', lunch),
        if (dinner.isNotEmpty) _buildMealTypeGroup('🌙 Cena', dinner),
        if (snacks.isNotEmpty) _buildMealTypeGroup('🍿 Snacks', snacks),
        // Bottom padding for FAB
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildMealTypeGroup(String title, List<Meal> meals) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        ...meals
            .map((meal) => Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(meal.foodItemNames.join(', ')),
                    subtitle: Text(
                        '${meal.totalCalories.round()} kcal • ${meal.totalProtein.round()}g Prot'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // TODO: Open detail/edit screen
                    },
                  ),
                ))
            .toList(),
      ],
    );
  }
}
