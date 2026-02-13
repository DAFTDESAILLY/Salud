import 'package:isar/isar.dart';

part 'user_profile.g.dart';

@collection
class UserProfile {
  Id id = Isar.autoIncrement;

  late String name = 'Usuario';
  DateTime? dateOfBirth;
  String? gender; // 'male', 'female', 'other' (was 'sex')

  // Physical Metrics
  double? weightKg; // (was 'weight')
  double? heightCm;

  // Preferences
  bool usesMetricSystem = true;
  bool darkModeEnabled = true; // Default dark
  String language = 'es';

  // Control
  late DateTime createdAt;
  late DateTime updatedAt;

  // Onboarding & Modules
  // Legacy / Hydration Support Fields
  late int age = 25;
  late String sex = 'male';
  late double weight = 70.0;

  @Enumerated(EnumType.ordinal)
  late ActivityLevel activityLevel = ActivityLevel.moderate;

  late double exerciseHours = 0.0;
  late bool usesCreatine = false;

  late int wakeUpHour = 7;
  late int wakeUpMinute = 0;
  late int bedTimeHour = 22;
  late int bedTimeMinute = 0;

  // Modern fields
  bool hasCompletedOnboarding = false;
  List<String> enabledModules = []; // ['hydration', 'fitness', 'nutrition']
}

enum ActivityLevel {
  sedentary, // 30 ml/kg
  moderate, // 35 ml/kg
  high // 40 ml/kg
}
