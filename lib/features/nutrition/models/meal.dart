import 'package:isar/isar.dart';

part 'meal.g.dart';

@collection
class Meal {
  Id id = Isar.autoIncrement;

  // Timestamp de la comida
  @Index()
  late DateTime timestamp;

  // Tipo de comida
  @Index()
  late String mealType; // 'breakfast', 'lunch', 'dinner', 'snack'

  // Alimentos incluidos (parallel arrays)
  late List<String> foodItemIds; // IDs de FoodItem
  late List<String>
      foodItemNames; // Nombres (denormalized para queries rápidas)
  late List<double> portionSizesGrams; // Cantidad en gramos de cada alimento

  // Totales calculados (denormalizados para performance)
  late double totalCalories;
  late double totalProtein;
  late double totalCarbs;
  late double totalFats;

  // Opcional
  String? notes; // "Comida en casa de mamá"
  String? photoPath; // Ruta local de foto (futuro)

  // Control
  late DateTime createdAt;
}
