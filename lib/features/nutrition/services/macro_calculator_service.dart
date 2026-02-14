import 'package:daftfits/core/auth/models/user_profile.dart'; // Updated package name
import 'package:daftfits/features/nutrition/models/nutrition_goal.dart';

class MacroCalculatorService {
  /// Calculates daily nutrition goals based on UserProfile
  NutritionGoal calculateGoals(UserProfile profile) {
    // 1. Calculate BMR (Mifflin-St Jeor Equation)
    double bmr;
    if (profile.gender == 'male') {
      bmr = (10 * (profile.weightKg ?? 70)) +
          (6.25 * (profile.heightCm ?? 175)) -
          (5 * profile.age) +
          5;
    } else {
      bmr = (10 * (profile.weightKg ?? 60)) +
          (6.25 * (profile.heightCm ?? 165)) -
          (5 * profile.age) -
          161;
    }

    // 2. Adjust for Activity Level
    double tdee;
    switch (profile.activityLevel) {
      case ActivityLevel.sedentary:
        tdee = bmr * 1.2;
        break;
      case ActivityLevel.moderate:
        tdee = bmr * 1.55;
        break;
      case ActivityLevel.high:
        tdee = bmr * 1.725;
        break;
      default:
        tdee = bmr * 1.2;
    }

    final targetCalories = tdee.round();

    // 3. Macronutrient Split (Standard Balanced Diet: 50% Carbs, 30% Fat, 20% Protein)
    // Protein: 4 kcal/g
    // Carbs: 4 kcal/g
    // Fats: 9 kcal/g

    // Can be adjusted based on goals (loss, gain, maintain) - simplified here
    final proteinRatio = 0.25; // Higher protein for fitness focus
    final fatRatio = 0.30;
    final carbRatio = 0.45;

    final targetProteinG = (targetCalories * proteinRatio / 4).round();
    final targetFatsG = (targetCalories * fatRatio / 9).round();
    final targetCarbsG = (targetCalories * carbRatio / 4).round();

    return NutritionGoal()
      ..date = DateTime.now() // Logic usually sets this for specific dates
      ..targetCalories = targetCalories
      ..targetProteinG = targetProteinG
      ..targetCarbsG = targetCarbsG
      ..targetFatsG = targetFatsG
      ..source = 'auto_calculated'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }
}
