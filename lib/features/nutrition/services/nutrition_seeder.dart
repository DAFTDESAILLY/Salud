import 'package:isar/isar.dart';
import 'package:daftfits/features/nutrition/models/food_item.dart';

class NutritionSeeder {
  final Isar isar;

  NutritionSeeder(this.isar);

  Future<void> seedInitialData() async {
    final count = await isar.foodItems.count();
    if (count > 0) return; // Already seeded

    final foods = [
      // Fruits
      FoodItem()
        ..foodId = 'apple_fresh_medium'
        ..name = 'Manzana'
        ..category = 'fruits'
        ..caloriesPer100g = 52
        ..proteinPer100g = 0.3
        ..carbsPer100g = 14
        ..fatsPer100g = 0.2
        ..fiberPer100g = 2.4
        ..servingUnit = 'pieza med'
        ..servingSizeGrams = 182
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now(),

      FoodItem()
        ..foodId = 'banana_fresh_medium'
        ..name = 'Plátano'
        ..category = 'fruits'
        ..caloriesPer100g = 89
        ..proteinPer100g = 1.1
        ..carbsPer100g = 22.8
        ..fatsPer100g = 0.3
        ..fiberPer100g = 2.6
        ..servingUnit = 'pieza med'
        ..servingSizeGrams = 118
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now(),

      // Proteins
      FoodItem()
        ..foodId = 'chicken_breast_cooked'
        ..name = 'Pechuga de Pollo (cocida)'
        ..category = 'protein'
        ..caloriesPer100g = 165
        ..proteinPer100g = 31
        ..carbsPer100g = 0
        ..fatsPer100g = 3.6
        ..servingUnit = 'filete'
        ..servingSizeGrams = 120
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now(),

      FoodItem()
        ..foodId = 'egg_whole_large'
        ..name = 'Huevo (entero)'
        ..category = 'protein'
        ..caloriesPer100g = 155
        ..proteinPer100g = 13
        ..carbsPer100g = 1.1
        ..fatsPer100g = 11
        ..servingUnit = 'pieza'
        ..servingSizeGrams = 50
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now(),

      // Carbs
      FoodItem()
        ..foodId = 'rice_white_cooked'
        ..name = 'Arroz Blanco (cocido)'
        ..category = 'grains'
        ..caloriesPer100g = 130
        ..proteinPer100g = 2.7
        ..carbsPer100g = 28
        ..fatsPer100g = 0.3
        ..servingUnit = 'taza'
        ..servingSizeGrams = 158
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now(),

      FoodItem()
        ..foodId = 'avocado_fresh'
        ..name = 'Aguacate'
        ..category = 'fats'
        ..caloriesPer100g = 160
        ..proteinPer100g = 2
        ..carbsPer100g = 8.5
        ..fatsPer100g = 14.7
        ..fiberPer100g = 6.7
        ..servingUnit = 'mitad'
        ..servingSizeGrams = 100
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now(),
    ];

    await isar.writeTxn(() async {
      await isar.foodItems.putAll(foods);
    });
  }
}
