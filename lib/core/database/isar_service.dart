import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:agua/features/hydration/models/hydration_log.dart';
import 'package:agua/features/hydration/models/daily_hydration_goal.dart';
import '../models/user_profile.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          UserProfileSchema,
          HydrationLogSchema,
          DailyHydrationGoalSchema,
        ],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
