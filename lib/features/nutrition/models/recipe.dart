import 'package:isar/isar.dart';

part 'recipe.g.dart';

@collection
class Recipe {
  Id id = Isar.autoIncrement;

  // Información básica
  late String name; // "Ensalada César", "Smoothie proteico"
  String? description; // Descripción breve

  // Ingredientes (parallel arrays)
  late List<String> ingredientFoodIds; // IDs de FoodItem
  late List<String> ingredientNames; // Nombres
  late List<double> ingredientAmounts; // Cantidades en gramos

  // Instrucciones de preparación
  List<String>? preparationSteps; // ["1. Lavar...", "2. Cortar..."]

  // Información nutricional TOTAL de la receta
  int servings = 1; // Número de porciones que rinde
  late double totalCalories;
  late double totalProtein;
  late double totalCarbs;
  late double totalFats;

  // Por porción (calculado)
  double get caloriesPerServing => totalCalories / servings;
  double get proteinPerServing => totalProtein / servings;
  double get carbsPerServing => totalCarbs / servings;
  double get fatsPerServing => totalFats / servings;

  // Metadata
  List<String>? tags; // ['vegetariano', 'alto-en-proteina', 'bajo-en-carbos']
  String? imageUrl; // Ruta local o URL (futuro)
  bool isFavorite = false;

  // Control
  late DateTime createdAt;
  late DateTime updatedAt;
}
