import 'package:isar/isar.dart';

part 'user_profile.g.dart';

@collection
class UserProfile {
  Id id = Isar.autoIncrement;

  late String name = 'Usuario'; // New field with default
  late int age; // 12-80
  late String sex; // 'male' | 'female'
  late double weight; // 30-250 kg

  @Enumerated(EnumType.ordinal)
  late ActivityLevel activityLevel;

  late double exerciseHours; // 0-4
  late bool usesCreatine;

  late int wakeUpHour = 7;
  late int wakeUpMinute = 0;
  late int bedTimeHour = 22;
  late int bedTimeMinute = 0;

  late DateTime createdAt;
  late DateTime updatedAt;
}

enum ActivityLevel {
  sedentary, // 30 ml/kg
  moderate, // 35 ml/kg
  high // 40 ml/kg
}
