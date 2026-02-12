import 'package:isar/isar.dart';

part 'daily_hydration_goal.g.dart';

@collection
class DailyHydrationGoal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late DateTime date; // Normalized to midnight (00:00:00)

  late int targetAmountMl;
}
