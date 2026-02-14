import 'package:isar/isar.dart';

part 'nutrition_goal.g.dart';

@collection
class NutritionGoal {
  Id id = Isar.autoIncrement;

  // Fecha de la meta
  @Index(unique: true, replace: true)
  late DateTime date; // Solo fecha, sin hora (midnight)

  // Metas de macros (gramos)
  late int targetCalories;
  late int targetProteinG;
  late int targetCarbsG;
  late int targetFatsG;

  // Origen de la meta
  String? source; // 'auto_calculated', 'manual', 'adjusted_by_workout'

  // Control
  late DateTime createdAt;
  late DateTime updatedAt;
}
