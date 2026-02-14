import 'package:isar/isar.dart';

part 'food_item.g.dart';

@collection
class FoodItem {
  Id id = Isar.autoIncrement;

  // Identificador único
  @Index(unique: true, replace: true)
  late String foodId; // 'apple_001', 'chicken_breast_001'

  // Información básica
  late String name; // "Manzana", "Pechuga de pollo"
  String? brand; // "Del Monte", null para genéricos

  // Categoría
  @Index()
  late String
      category; // 'fruits', 'protein', 'grains', 'vegetables', 'dairy', 'fats', 'snacks'

  // Macronutrientes POR 100g (estándar USDA)
  late double caloriesPer100g;
  late double proteinPer100g; // gramos
  late double carbsPer100g; // gramos
  late double fatsPer100g; // gramos

  // Opcional: Fibra y azúcares
  double? fiberPer100g;
  double? sugarPer100g;

  // Tamaño de porción común (para UX más fácil)
  String? servingUnit; // 'pieza', 'taza', 'cucharada', 'rebanada'
  double? servingSizeGrams; // 150g para "1 pieza de manzana"

  // Metadata
  bool isCustom = false; // true = creado por usuario, false = predefinido
  bool isFavorite = false; // Marcado como favorito

  // Control
  late DateTime createdAt;
  late DateTime updatedAt;
}
