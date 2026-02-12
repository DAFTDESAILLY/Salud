import 'package:isar/isar.dart';

part 'hydration_log.g.dart';

@collection
class HydrationLog {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime timestamp; // Stores exact time. Query range for daily logs.

  late int amountMl;

  String? beverageType = 'water';

  int? effectiveAmountMl;
}
