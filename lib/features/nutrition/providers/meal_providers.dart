import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:daftfits/features/nutrition/models/meal.dart';
import 'package:daftfits/features/hydration/providers/hydration_providers.dart';

// Provides meals for a specific date
final mealsByDateProvider =
    FutureProvider.family<List<Meal>, DateTime>((ref, date) async {
  final isar = await ref.watch(isarProvider.future);

  final startOfDay = DateTime(date.year, date.month, date.day);
  final endOfDay = startOfDay.add(const Duration(days: 1));

  return isar.meals
      .filter()
      .timestampBetween(startOfDay, endOfDay)
      .sortByTimestamp()
      .findAll();
});

// Provides meals for "today" specifically (auto-updating)
final todayMealsProvider = Provider<AsyncValue<List<Meal>>>((ref) {
  final now = DateTime.now();
  return ref.watch(mealsByDateProvider(now));
});

// Provides total nutrition for a specific date
class DailyNutritionSummary {
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFats;

  DailyNutritionSummary({
    this.totalCalories = 0,
    this.totalProtein = 0,
    this.totalCarbs = 0,
    this.totalFats = 0,
  });
}

final dailyNutritionSummaryProvider =
    Provider.family<AsyncValue<DailyNutritionSummary>, DateTime>((ref, date) {
  final mealsAsync = ref.watch(mealsByDateProvider(date));

  return mealsAsync.whenData((meals) {
    double calories = 0;
    double protein = 0;
    double carbs = 0;
    double fats = 0;

    for (var meal in meals) {
      calories += meal.totalCalories;
      protein += meal.totalProtein;
      carbs += meal.totalCarbs;
      fats += meal.totalFats;
    }

    return DailyNutritionSummary(
      totalCalories: calories,
      totalProtein: protein,
      totalCarbs: carbs,
      totalFats: fats,
    );
  });
});

final todayNutritionSummaryProvider =
    Provider<AsyncValue<DailyNutritionSummary>>((ref) {
  final now = DateTime.now();
  return ref.watch(dailyNutritionSummaryProvider(now));
});
