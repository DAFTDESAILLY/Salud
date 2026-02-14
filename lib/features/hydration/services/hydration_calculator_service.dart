import 'package:daftfits/core/auth/models/user_profile.dart';

class HydrationCalculatorService {
  static const int _baseCreatineMl = 300;
  static const int _mlPerExerciseHour = 600;

  int calculateDailyGoal(UserProfile profile) {
    // 1. Base calculation
    double mlPerKg;
    switch (profile.activityLevel) {
      case ActivityLevel.sedentary:
        mlPerKg = 30;
        break;
      case ActivityLevel.moderate:
        mlPerKg = 35;
        break;
      case ActivityLevel.high:
        mlPerKg = 40;
        break;
    }

    double baseGoal = profile.weight * mlPerKg;

    // 2. Exercise
    double exerciseGoal = profile.exerciseHours * _mlPerExerciseHour;

    // 3. Creatine
    int creatineGoal = profile.usesCreatine ? _baseCreatineMl : 0;

    // Total
    return (baseGoal + exerciseGoal + creatineGoal).round();
  }
}
