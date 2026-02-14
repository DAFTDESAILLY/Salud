import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:daftfits/core/auth/providers/auth_providers.dart';
import 'package:daftfits/features/nutrition/models/nutrition_goal.dart';
import 'package:daftfits/features/nutrition/services/macro_calculator_service.dart';

// Provides the nutrition goal for a specific date
final nutritionGoalProvider =
    FutureProvider.family<NutritionGoal, DateTime>((ref, date) async {
  final isar = await ref.watch(isarProvider.future);
  final dateOnly = DateTime(date.year, date.month, date.day);

  // 1. Try to find existing goal
  final existingGoal =
      await isar.nutritionGoals.filter().dateEqualTo(dateOnly).findFirst();

  if (existingGoal != null) {
    return existingGoal;
  }

  // 2. If not found, calculate one based on user profile
  final userProfile = await ref.watch(userProfileProvider.future);

  if (userProfile != null) {
    final calculator = MacroCalculatorService();
    final newGoal = calculator.calculateGoals(userProfile);
    newGoal.date = dateOnly; // Override date

    // Persist it
    await isar.writeTxn(() async {
      await isar.nutritionGoals.put(newGoal);
    });

    return newGoal;
  }

  // 3. Fallback default if no profile
  return NutritionGoal()
    ..date = dateOnly
    ..targetCalories = 2000
    ..targetProteinG = 150
    ..targetCarbsG = 200
    ..targetFatsG = 65
    ..source = 'default_fallback'
    ..createdAt = DateTime.now()
    ..updatedAt = DateTime.now();
});

final todayNutritionGoalProvider = Provider<AsyncValue<NutritionGoal>>((ref) {
  final now = DateTime.now();
  return ref.watch(nutritionGoalProvider(now));
});
