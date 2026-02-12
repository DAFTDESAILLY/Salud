import 'package:isar/isar.dart';

part 'hydration_settings.g.dart';

@collection
class HydrationSettings {
  Id id = Isar.autoIncrement;

  late bool isCustomGoal; // If true, user manually set the goal
  late DateTime updatedAt;
  
  // We might store the "current/active" goal here for quick access, 
  // but the source of truth for history is DailyHydrationGoal.
  // The persistent "base" goal (calculated or custom) could live here.
  late int baseGoalMl; 
}
