import 'package:isar/isar.dart';

part 'beverage_config.g.dart';

@collection
class BeverageConfig {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String type; // 'water', 'coffee', etc.

  late String name; // Display name e.g. 'Agua', 'Café'

  late double coefficient; // 1.0, 0.8, etc.

  late bool isEnabled = true;

  late int colorValue; // Store int value of Color for UI

  int? iconCodePoint; // For custom icons

  List<int>? presetSizes; // Custom default sizes

  late DateTime updatedAt;
}
