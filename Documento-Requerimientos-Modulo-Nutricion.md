# 📄 DOCUMENTO DE REQUERIMIENTOS TÉCNICOS
## Módulo de Nutrición - Super App Salud v3.0

**Versión:** 3.0-NUTRITION  
**Fecha:** Febrero 2026  
**Estado:** Diseño detallado - Listo para implementación  
**Arquitectura:** Flutter + Riverpod + Isar (Offline-first)  
**Patrón de diseño:** Basado en módulo de Hidratación existente

---

## 🎯 1. VISIÓN DEL MÓDULO

### 1.1 Propósito
Crear un sistema completo de registro y tracking nutricional que permita al usuario:
- Registrar comidas diarias con precisión
- Trackear macronutrientes (proteínas, carbohidratos, grasas)
- Monitorear calorías consumidas vs objetivo
- Guardar recetas favoritas
- Visualizar tendencias nutricionales

### 1.2 Principios de diseño
- **Simplicidad**: Registro rápido de comidas en <30 segundos
- **Consistencia**: Mantener el lenguaje visual del módulo de Hidratación
- **Offline-first**: 100% funcional sin conexión
- **Precisión**: Base de datos con macros validados científicamente

---

## 🏗️ 2. ARQUITECTURA DEL MÓDULO

### 2.1 Estructura de archivos

```
lib/features/nutrition/
├── models/
│   ├── food_item.dart           # Alimento individual
│   ├── food_item.g.dart         # Generado por build_runner
│   ├── meal.dart                # Comida registrada
│   ├── meal.g.dart
│   ├── recipe.dart              # Receta guardada
│   ├── recipe.g.dart
│   ├── nutrition_goal.dart      # Meta diaria de macros
│   └── nutrition_goal.g.dart
│
├── providers/
│   ├── food_providers.dart      # Providers de alimentos
│   ├── meal_providers.dart      # Providers de comidas
│   ├── recipe_providers.dart    # Providers de recetas
│   └── nutrition_providers.dart # Providers generales
│
├── screens/
│   ├── nutrition_home.dart      # Dashboard principal
│   ├── meal_log_screen.dart     # Registro de comida
│   ├── food_database_screen.dart # Base de alimentos
│   ├── add_food_screen.dart     # Crear alimento custom
│   ├── recipe_list_screen.dart  # Lista de recetas
│   ├── recipe_detail_screen.dart # Detalle/editar receta
│   ├── create_recipe_screen.dart # Nueva receta
│   ├── nutrition_history_screen.dart # Historial semanal
│   └── nutrition_settings_screen.dart # Configuración de metas
│
├── widgets/
│   ├── macro_ring_chart.dart    # Anillo de macros (como progress circle)
│   ├── calorie_counter_widget.dart # Contador principal
│   ├── meal_card.dart           # Card de comida
│   ├── food_item_tile.dart      # Item en lista de alimentos
│   ├── macro_bar_chart.dart     # Gráfica de barras
│   ├── quick_add_meal_button.dart # Botón de acceso rápido
│   └── nutrition_summary_card.dart # Resumen del día
│
└── services/
    ├── macro_calculator_service.dart # Cálculo de macros
    ├── nutrition_seeder.dart         # Seed de 100+ alimentos
    └── portion_converter.dart        # Conversión de porciones
```

---

## 📊 3. MODELOS DE DATOS

### 3.1 FoodItem (Alimento individual)

```dart
// lib/features/nutrition/models/food_item.dart
import 'package:isar/isar.dart';

part 'food_item.g.dart';

@collection
class FoodItem {
  Id id = Isar.autoIncrement;

  // Identificador único
  @Index(unique: true)
  late String foodId; // 'apple_001', 'chicken_breast_001'

  // Información básica
  late String name; // "Manzana", "Pechuga de pollo"
  String? brand; // "Del Monte", null para genéricos
  
  // Categoría
  @Index()
  late String category; // 'fruits', 'protein', 'grains', 'vegetables', 'dairy', 'fats', 'snacks'
  
  // Macronutrientes POR 100g (estándar USDA)
  late double caloriesPer100g;
  late double proteinPer100g;    // gramos
  late double carbsPer100g;      // gramos
  late double fatsPer100g;       // gramos
  
  // Opcional: Fibra y azúcares
  double? fiberPer100g;
  double? sugarPer100g;
  
  // Tamaño de porción común (para UX más fácil)
  String? servingUnit;        // 'pieza', 'taza', 'cucharada', 'rebanada'
  double? servingSizeGrams;   // 150g para "1 pieza de manzana"
  
  // Metadata
  bool isCustom;              // true = creado por usuario, false = predefinido
  bool isFavorite;            // Marcado como favorito
  
  // Control
  late DateTime createdAt;
  late DateTime updatedAt;
}
```

**Ejemplos de datos:**
```dart
// Manzana
FoodItem()
  ..foodId = 'apple_001'
  ..name = 'Manzana'
  ..category = 'fruits'
  ..caloriesPer100g = 52
  ..proteinPer100g = 0.3
  ..carbsPer100g = 14
  ..fatsPer100g = 0.2
  ..fiberPer100g = 2.4
  ..servingUnit = 'pieza'
  ..servingSizeGrams = 150
  ..isCustom = false
  ..isFavorite = false

// Pechuga de pollo
FoodItem()
  ..foodId = 'chicken_breast_001'
  ..name = 'Pechuga de pollo (cocida)'
  ..category = 'protein'
  ..caloriesPer100g = 165
  ..proteinPer100g = 31
  ..carbsPer100g = 0
  ..fatsPer100g = 3.6
  ..servingUnit = 'porción'
  ..servingSizeGrams = 120
  ..isCustom = false
```

---

### 3.2 Meal (Comida registrada)

```dart
// lib/features/nutrition/models/meal.dart
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
  late List<String> foodItemIds;        // IDs de FoodItem
  late List<String> foodItemNames;      // Nombres (denormalized para queries rápidas)
  late List<double> portionSizesGrams;  // Cantidad en gramos de cada alimento
  
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
```

**Ejemplo de comida:**
```dart
Meal()
  ..timestamp = DateTime(2026, 2, 13, 13, 30)
  ..mealType = 'lunch'
  ..foodItemIds = ['chicken_breast_001', 'rice_white_001', 'broccoli_001']
  ..foodItemNames = ['Pechuga de pollo', 'Arroz blanco', 'Brócoli']
  ..portionSizesGrams = [150, 200, 100]
  ..totalCalories = 560  // Calculado
  ..totalProtein = 52
  ..totalCarbs = 68
  ..totalFats = 6
  ..notes = 'Almuerzo preparado en casa'
  ..createdAt = DateTime.now()
```

---

### 3.3 Recipe (Receta guardada)

```dart
// lib/features/nutrition/models/recipe.dart
import 'package:isar/isar.dart';

part 'recipe.g.dart';

@collection
class Recipe {
  Id id = Isar.autoIncrement;

  // Información básica
  late String name; // "Ensalada César", "Smoothie proteico"
  String? description; // Descripción breve
  
  // Ingredientes (parallel arrays)
  late List<String> ingredientFoodIds;    // IDs de FoodItem
  late List<String> ingredientNames;      // Nombres
  late List<double> ingredientAmounts;    // Cantidades en gramos
  
  // Instrucciones de preparación
  List<String>? preparationSteps; // ["1. Lavar...", "2. Cortar..."]
  
  // Información nutricional TOTAL de la receta
  int servings;                  // Número de porciones que rinde
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
  bool isFavorite;
  
  // Control
  late DateTime createdAt;
  late DateTime updatedAt;
  
  Recipe() : servings = 1, isFavorite = false;
}
```

---

### 3.4 NutritionGoal (Meta nutricional diaria)

```dart
// lib/features/nutrition/models/nutrition_goal.dart
import 'package:isar/isar.dart';

part 'nutrition_goal.g.dart';

@collection
class NutritionGoal {
  Id id = Isar.autoIncrement;

  // Fecha de la meta
  @Index(unique: true)
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
```

**Lógica de cálculo automático:**
```dart
// Basado en perfil del usuario y objetivo
// Ejemplo: Usuario 70kg, objetivo mantener peso, actividad moderada
NutritionGoal()
  ..date = DateTime(2026, 2, 13)
  ..targetCalories = 2200  // TDEE
  ..targetProteinG = 140   // 2g por kg
  ..targetCarbsG = 220     // 40% de calorías
  ..targetFatsG = 73       // 30% de calorías
  ..source = 'auto_calculated'
```

---

## 🎨 4. INTERFACES (SCREENS)

### 4.1 NutritionHome (Dashboard principal)

**Ruta:** `lib/features/nutrition/screens/nutrition_home.dart`

**Layout:**
```
┌─────────────────────────────────────┐
│  🍎 Nutrición                  ⚙️   │ ← AppBar
├─────────────────────────────────────┤
│                                     │
│  📊 Calorías del día                │
│  ┌───────────────────────────────┐  │
│  │      [Macro Ring Chart]       │  │ ← Widget principal
│  │                               │  │
│  │       1,450 / 2,200 kcal     │  │
│  │                               │  │
│  │  P: 95g/140g  C: 160g/220g   │  │
│  │       F: 48g/73g              │  │
│  └───────────────────────────────┘  │
│                                     │
│  🍽️ Comidas de hoy                 │
│  ┌───────────────────────────────┐  │
│  │ ☀️ Desayuno          450 kcal │  │ ← MealCard
│  │ 3 items                       │  │
│  └───────────────────────────────┘  │
│  ┌───────────────────────────────┐  │
│  │ 🌞 Almuerzo          620 kcal │  │
│  │ 5 items                       │  │
│  └───────────────────────────────┘  │
│  ┌───────────────────────────────┐  │
│  │ 🌙 Cena              380 kcal │  │
│  │ 4 items                       │  │
│  └───────────────────────────────┘  │
│                                     │
│  [+ Agregar Comida]                 │ ← FAB
└─────────────────────────────────────┘
```

**Código base:**
```dart
class NutritionHome extends ConsumerWidget {
  const NutritionHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayMeals = ref.watch(todayMealsProvider);
    final todayNutrition = ref.watch(todayNutritionSummaryProvider);
    final nutritionGoal = ref.watch(todayNutritionGoalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrición'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NutritionSettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Macro Ring Chart
          MacroRingChart(
            currentCalories: todayNutrition.totalCalories,
            goalCalories: nutritionGoal?.targetCalories ?? 2000,
            currentProtein: todayNutrition.totalProtein,
            goalProtein: nutritionGoal?.targetProteinG ?? 150,
            currentCarbs: todayNutrition.totalCarbs,
            goalCarbs: nutritionGoal?.targetCarbsG ?? 200,
            currentFats: todayNutrition.totalFats,
            goalFats: nutritionGoal?.targetFatsG ?? 65,
          ),
          
          const SizedBox(height: 32),
          
          // Lista de comidas
          Text(
            '🍽️ Comidas de hoy',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          
          todayMeals.when(
            data: (meals) => _buildMealsList(context, meals),
            loading: () => const CircularProgressIndicator(),
            error: (err, _) => Text('Error: $err'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MealLogScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Agregar Comida'),
      ),
    );
  }

  Widget _buildMealsList(BuildContext context, List<Meal> meals) {
    // Agrupar por tipo de comida
    final breakfast = meals.where((m) => m.mealType == 'breakfast').toList();
    final lunch = meals.where((m) => m.mealType == 'lunch').toList();
    final dinner = meals.where((m) => m.mealType == 'dinner').toList();
    final snacks = meals.where((m) => m.mealType == 'snack').toList();

    return Column(
      children: [
        if (breakfast.isNotEmpty)
          MealTypeCard(
            icon: '☀️',
            title: 'Desayuno',
            meals: breakfast,
            mealType: 'breakfast',
          ),
        const SizedBox(height: 12),
        if (lunch.isNotEmpty)
          MealTypeCard(
            icon: '🌞',
            title: 'Almuerzo',
            meals: lunch,
            mealType: 'lunch',
          ),
        const SizedBox(height: 12),
        if (dinner.isNotEmpty)
          MealTypeCard(
            icon: '🌙',
            title: 'Cena',
            meals: dinner,
            mealType: 'dinner',
          ),
        const SizedBox(height: 12),
        if (snacks.isNotEmpty)
          MealTypeCard(
            icon: '🍿',
            title: 'Snacks',
            meals: snacks,
            mealType: 'snack',
          ),
      ],
    );
  }
}
```

---

### 4.2 MealLogScreen (Registro de comida)

**Ruta:** `lib/features/nutrition/screens/meal_log_screen.dart`

**Layout:**
```
┌─────────────────────────────────────┐
│  ← Registrar Comida                 │
├─────────────────────────────────────┤
│                                     │
│  Tipo de comida                     │
│  [ Desayuno ▼ ]                     │ ← Dropdown
│                                     │
│  Alimentos agregados (0)            │
│  ┌─────────────────────────────┐    │
│  │   [Estado vacío]            │    │
│  │   Toca + para agregar       │    │
│  └─────────────────────────────┘    │
│                                     │
│  [+ Agregar Alimento]               │ ← Botón principal
│  [📖 Usar Receta]                   │
│                                     │
│  ─────────────────────────────      │
│                                     │
│  💡 Resumen                         │
│  Calorías: 0 kcal                   │
│  Proteínas: 0g                      │
│  Carbohidratos: 0g                  │
│  Grasas: 0g                         │
│                                     │
│  [ Guardar Comida ]                 │ ← FilledButton
└─────────────────────────────────────┘
```

**Con alimentos agregados:**
```
┌─────────────────────────────────────┐
│  ← Registrar Comida                 │
├─────────────────────────────────────┤
│  Tipo: Almuerzo                     │
│                                     │
│  Alimentos (3)                      │
│  ┌─────────────────────────────┐    │
│  │ 🍗 Pechuga de pollo         │    │
│  │    150g · 248 kcal      [×] │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │ 🍚 Arroz blanco             │    │
│  │    200g · 260 kcal      [×] │    │
│  └─────────────────────────────┘    │
│  ┌─────────────────────────────┐    │
│  │ 🥦 Brócoli                  │    │
│  │    100g · 34 kcal       [×] │    │
│  └─────────────────────────────┘    │
│                                     │
│  [+ Agregar Alimento]               │
│                                     │
│  💡 Total                           │
│  ┌─────────────────────────────┐    │
│  │ Calorías:      542 kcal     │    │
│  │ Proteínas:     52g          │    │
│  │ Carbohidratos: 68g          │    │
│  │ Grasas:        6g           │    │
│  └─────────────────────────────┘    │
│                                     │
│  Notas (opcional)                   │
│  [____________]                     │
│                                     │
│  [ Guardar Comida ]                 │
└─────────────────────────────────────┘
```

**Código base:**
```dart
class MealLogScreen extends ConsumerStatefulWidget {
  final Meal? existingMeal; // null para nueva, o editar existente
  
  const MealLogScreen({super.key, this.existingMeal});

  @override
  ConsumerState<MealLogScreen> createState() => _MealLogScreenState();
}

class _MealLogScreenState extends ConsumerState<MealLogScreen> {
  late String _selectedMealType;
  final List<_FoodEntry> _foodEntries = [];
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    if (widget.existingMeal != null) {
      // Cargar datos existentes
      _selectedMealType = widget.existingMeal!.mealType;
      for (int i = 0; i < widget.existingMeal!.foodItemIds.length; i++) {
        _foodEntries.add(_FoodEntry(
          foodId: widget.existingMeal!.foodItemIds[i],
          foodName: widget.existingMeal!.foodItemNames[i],
          portionGrams: widget.existingMeal!.portionSizesGrams[i],
        ));
      }
      _notesController.text = widget.existingMeal!.notes ?? '';
    } else {
      // Detectar tipo de comida según hora
      final now = DateTime.now();
      if (now.hour < 11) {
        _selectedMealType = 'breakfast';
      } else if (now.hour < 16) {
        _selectedMealType = 'lunch';
      } else if (now.hour < 20) {
        _selectedMealType = 'dinner';
      } else {
        _selectedMealType = 'snack';
      }
    }
  }

  void _addFoodItem() async {
    // Navegar a FoodDatabaseScreen para seleccionar
    final selectedFood = await Navigator.push<FoodItem>(
      context,
      MaterialPageRoute(
        builder: (_) => const FoodDatabaseScreen(),
      ),
    );

    if (selectedFood != null) {
      // Mostrar diálogo para especificar cantidad
      final portion = await _showPortionDialog(selectedFood);
      if (portion != null && portion > 0) {
        setState(() {
          _foodEntries.add(_FoodEntry(
            foodId: selectedFood.foodId,
            foodName: selectedFood.name,
            portionGrams: portion,
          ));
        });
      }
    }
  }

  Future<double?> _showPortionDialog(FoodItem food) async {
    final controller = TextEditingController(
      text: food.servingSizeGrams?.toString() ?? '100',
    );

    return showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Cantidad de ${food.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Gramos',
                suffixText: 'g',
              ),
            ),
            if (food.servingUnit != null) ...[
              const SizedBox(height: 8),
              Text(
                'Referencia: 1 ${food.servingUnit} ≈ ${food.servingSizeGrams}g',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              final value = double.tryParse(controller.text);
              Navigator.pop(context, value);
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveMeal() async {
    if (_foodEntries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agrega al menos un alimento')),
      );
      return;
    }

    final isar = await ref.read(isarProvider.future);
    
    // Calcular totales
    double totalCals = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFats = 0;

    // Obtener datos de alimentos
    for (var entry in _foodEntries) {
      final food = await isar.foodItems
          .filter()
          .foodIdEqualTo(entry.foodId)
          .findFirst();
      
      if (food != null) {
        final factor = entry.portionGrams / 100;
        totalCals += food.caloriesPer100g * factor;
        totalProtein += food.proteinPer100g * factor;
        totalCarbs += food.carbsPer100g * factor;
        totalFats += food.fatsPer100g * factor;
      }
    }

    final meal = Meal()
      ..timestamp = widget.existingMeal?.timestamp ?? DateTime.now()
      ..mealType = _selectedMealType
      ..foodItemIds = _foodEntries.map((e) => e.foodId).toList()
      ..foodItemNames = _foodEntries.map((e) => e.foodName).toList()
      ..portionSizesGrams = _foodEntries.map((e) => e.portionGrams).toList()
      ..totalCalories = totalCals
      ..totalProtein = totalProtein
      ..totalCarbs = totalCarbs
      ..totalFats = totalFats
      ..notes = _notesController.text.isEmpty ? null : _notesController.text
      ..createdAt = widget.existingMeal?.createdAt ?? DateTime.now();

    await isar.writeTxn(() async {
      await isar.meals.put(meal);
    });

    ref.invalidate(todayMealsProvider);
    
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comida guardada')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calcular resumen
    double totalCalories = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFats = 0;

    // Aquí necesitas fetch de FoodItems para calcular
    // En el código real, usa FutureBuilder o providers

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingMeal == null ? 'Registrar Comida' : 'Editar Comida'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Tipo de comida
          DropdownButtonFormField<String>(
            value: _selectedMealType,
            decoration: const InputDecoration(
              labelText: 'Tipo de comida',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'breakfast', child: Text('☀️ Desayuno')),
              DropdownMenuItem(value: 'lunch', child: Text('🌞 Almuerzo')),
              DropdownMenuItem(value: 'dinner', child: Text('🌙 Cena')),
              DropdownMenuItem(value: 'snack', child: Text('🍿 Snack')),
            ],
            onChanged: (value) {
              setState(() => _selectedMealType = value!);
            },
          ),

          const SizedBox(height: 24),

          // Lista de alimentos
          Text(
            'Alimentos agregados (${_foodEntries.length})',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),

          if (_foodEntries.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Icon(Icons.restaurant, size: 48, color: Colors.grey),
                    const SizedBox(height: 8),
                    Text(
                      'No hay alimentos agregados',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else
            ..._foodEntries.asMap().entries.map((entry) {
              final index = entry.key;
              final foodEntry = entry.value;
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.restaurant_menu),
                    title: Text(foodEntry.foodName),
                    subtitle: Text('${foodEntry.portionGrams}g · ${_calculateCalories(foodEntry)} kcal'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() => _foodEntries.removeAt(index));
                      },
                    ),
                  ),
                ),
              );
            }).toList(),

          const SizedBox(height: 16),

          // Botones de agregar
          OutlinedButton.icon(
            onPressed: _addFoodItem,
            icon: const Icon(Icons.add),
            label: const Text('Agregar Alimento'),
          ),

          const SizedBox(height: 8),

          OutlinedButton.icon(
            onPressed: () {
              // TODO: Implementar selector de recetas
            },
            icon: const Icon(Icons.book),
            label: const Text('Usar Receta'),
          ),

          const SizedBox(height: 32),

          // Resumen nutricional
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡 Resumen',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  _buildNutrientRow('Calorías', '${totalCalories.toInt()} kcal'),
                  _buildNutrientRow('Proteínas', '${totalProtein.toInt()}g'),
                  _buildNutrientRow('Carbohidratos', '${totalCarbs.toInt()}g'),
                  _buildNutrientRow('Grasas', '${totalFats.toInt()}g'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Notas
          TextField(
            controller: _notesController,
            decoration: const InputDecoration(
              labelText: 'Notas (opcional)',
              hintText: 'Ej: Comida en casa de mamá',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),

          const SizedBox(height: 32),

          // Botón guardar
          FilledButton(
            onPressed: _saveMeal,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Guardar Comida'),
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  int _calculateCalories(_FoodEntry entry) {
    // TODO: Fetch real food data
    return 0;
  }
}

class _FoodEntry {
  final String foodId;
  final String foodName;
  final double portionGrams;

  _FoodEntry({
    required this.foodId,
    required this.foodName,
    required this.portionGrams,
  });
}
```

---

### 4.3 FoodDatabaseScreen (Base de datos de alimentos)

**Layout:**
```
┌─────────────────────────────────────┐
│  ← Base de Alimentos                │
├─────────────────────────────────────┤
│  [🔍 Buscar alimentos...]           │ ← SearchBar
│                                     │
│  Categorías                         │
│  [Todas] [Frutas] [Proteínas] ...  │ ← FilterChips
│                                     │
│  ⭐ Favoritos (3)                   │
│  ┌─────────────────────────────┐    │
│  │ 🍗 Pechuga de pollo         │    │
│  │    165 kcal/100g        [+] │    │
│  └─────────────────────────────┘    │
│  ...                                │
│                                     │
│  🍎 Frutas (15)                     │
│  ┌─────────────────────────────┐    │
│  │ 🍌 Plátano                  │    │
│  │    89 kcal/100g         [+] │    │
│  └─────────────────────────────┘    │
│  ...                                │
│                                     │
│  [+ Crear Alimento Custom]          │ ← FAB
└─────────────────────────────────────┘
```

**Código base:**
```dart
class FoodDatabaseScreen extends ConsumerStatefulWidget {
  const FoodDatabaseScreen({super.key});

  @override
  ConsumerState<FoodDatabaseScreen> createState() => _FoodDatabaseScreenState();
}

class _FoodDatabaseScreenState extends ConsumerState<FoodDatabaseScreen> {
  String _searchQuery = '';
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final foodsAsync = ref.watch(foodItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Base de Alimentos'),
      ),
      body: Column(
        children: [
          // Buscador
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar alimentos...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value.toLowerCase());
              },
            ),
          ),

          // Filtros de categoría
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryChip('Todas', null),
                _buildCategoryChip('Frutas', 'fruits'),
                _buildCategoryChip('Proteínas', 'protein'),
                _buildCategoryChip('Granos', 'grains'),
                _buildCategoryChip('Vegetales', 'vegetables'),
                _buildCategoryChip('Lácteos', 'dairy'),
                _buildCategoryChip('Grasas', 'fats'),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Lista de alimentos
          Expanded(
            child: foodsAsync.when(
              data: (foods) {
                // Filtrar
                var filtered = foods.where((food) {
                  final matchesSearch = food.name.toLowerCase().contains(_searchQuery);
                  final matchesCategory = _selectedCategory == null || 
                                         food.category == _selectedCategory;
                  return matchesSearch && matchesCategory;
                }).toList();

                // Ordenar: favoritos primero
                filtered.sort((a, b) {
                  if (a.isFavorite != b.isFavorite) {
                    return a.isFavorite ? -1 : 1;
                  }
                  return a.name.compareTo(b.name);
                });

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return FoodItemTile(
                      food: filtered[index],
                      onTap: () {
                        Navigator.pop(context, filtered[index]);
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddFoodScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCategoryChip(String label, String? category) {
    final isSelected = _selectedCategory == category;
    
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedCategory = selected ? category : null;
          });
        },
      ),
    );
  }
}
```

---

### 4.4 Otras pantallas (resumen)

**AddFoodScreen** - Similar a `AddBeverageScreen` del módulo de hidratación
- Formulario para crear alimento personalizado
- Campos: nombre, categoría, macros por 100g
- Validación de datos

**RecipeListScreen** - Lista de recetas guardadas
- Grid o lista de cards con recetas
- Filtros por tags
- Favoritos

**RecipeDetailScreen** - Detalle de receta
- Ingredientes con cantidades
- Pasos de preparación
- Info nutricional
- Botón "Usar en comida"

**CreateRecipeScreen** - Crear receta nueva
- Agregar múltiples ingredientes
- Especificar porciones
- Instrucciones paso a paso

**NutritionHistoryScreen** - Historial semanal
- Similar a `HistoryScreen` de hidratación
- Gráfica de calorías por día
- Lista de comidas pasadas

**NutritionSettingsScreen** - Configuración
- Establecer metas manuales
- Preferencias de unidades
- Reset de datos

---

## 🧩 5. WIDGETS REUTILIZABLES

### 5.1 MacroRingChart

**Descripción:** Anillo circular que muestra progreso de calorías con segmentos de macros

```dart
class MacroRingChart extends StatelessWidget {
  final double currentCalories;
  final double goalCalories;
  final double currentProtein;
  final double goalProtein;
  final double currentCarbs;
  final double goalCarbs;
  final double currentFats;
  final double goalFats;

  const MacroRingChart({
    super.key,
    required this.currentCalories,
    required this.goalCalories,
    required this.currentProtein,
    required this.goalProtein,
    required this.currentCarbs,
    required this.goalCarbs,
    required this.currentFats,
    required this.goalFats,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentCalories / goalCalories).clamp(0.0, 1.0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Anillo principal (usar CustomPaint o fl_chart)
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Aquí va CustomPaint con anillo segmentado
                  _buildRing(progress),
                  
                  // Texto central
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${currentCalories.toInt()}',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'de ${goalCalories.toInt()} kcal',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Macros breakdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMacroIndicator(
                  'Proteína',
                  currentProtein,
                  goalProtein,
                  Colors.red,
                ),
                _buildMacroIndicator(
                  'Carbos',
                  currentCarbs,
                  goalCarbs,
                  Colors.blue,
                ),
                _buildMacroIndicator(
                  'Grasas',
                  currentFats,
                  goalFats,
                  Colors.amber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRing(double progress) {
    // Implementar CustomPaint o usar package como fl_chart
    return CircularProgressIndicator(value: progress); // Placeholder
  }

  Widget _buildMacroIndicator(
    String label,
    double current,
    double goal,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          '${current.toInt()}/${goal.toInt()}g',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
```

---

### 5.2 MealCard

**Descripción:** Card que muestra resumen de una comida

```dart
class MealCard extends ConsumerWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navegar a detalle o editar
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MealLogScreen(existingMeal: meal),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        _getMealIcon(meal.mealType),
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _getMealLabel(meal.mealType),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Text(
                    '${meal.totalCalories.toInt()} kcal',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${meal.foodItemNames.length} items',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildMacroChip('P', meal.totalProtein, Colors.red),
                  const SizedBox(width: 8),
                  _buildMacroChip('C', meal.totalCarbs, Colors.blue),
                  const SizedBox(width: 8),
                  _buildMacroChip('G', meal.totalFats, Colors.amber),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMacroChip(String label, double value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$label: ${value.toInt()}g',
        style: TextStyle(fontSize: 12, color: color),
      ),
    );
  }

  String _getMealIcon(String type) {
    switch (type) {
      case 'breakfast': return '☀️';
      case 'lunch': return '🌞';
      case 'dinner': return '🌙';
      case 'snack': return '🍿';
      default: return '🍽️';
    }
  }

  String _getMealLabel(String type) {
    switch (type) {
      case 'breakfast': return 'Desayuno';
      case 'lunch': return 'Almuerzo';
      case 'dinner': return 'Cena';
      case 'snack': return 'Snack';
      default: return 'Comida';
    }
  }
}
```

---

### 5.3 FoodItemTile

**Descripción:** Item en lista de base de datos de alimentos

```dart
class FoodItemTile extends ConsumerWidget {
  final FoodItem food;
  final VoidCallback? onTap;

  const FoodItemTile({
    super.key,
    required this.food,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _getCategoryColor(food.category).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _getCategoryIcon(food.category),
            color: _getCategoryColor(food.category),
          ),
        ),
        title: Row(
          children: [
            Text(food.name),
            if (food.isFavorite) ...[
              const SizedBox(width: 4),
              const Icon(Icons.star, size: 16, color: Colors.amber),
            ],
          ],
        ),
        subtitle: Text('${food.caloriesPer100g.toInt()} kcal/100g'),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle),
          onPressed: onTap,
        ),
        onTap: onTap,
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'fruits': return Colors.orange;
      case 'protein': return Colors.red;
      case 'grains': return Colors.brown;
      case 'vegetables': return Colors.green;
      case 'dairy': return Colors.blue;
      case 'fats': return Colors.amber;
      default: return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'fruits': return Icons.apple;
      case 'protein': return Icons.egg;
      case 'grains': return Icons.grain;
      case 'vegetables': return Icons.eco;
      case 'dairy': return Icons.water_drop;
      case 'fats': return Icons.oil_barrel;
      default: return Icons.restaurant;
    }
  }
}
```

---

## 🔌 6. PROVIDERS (RIVERPOD)

### 6.1 Providers de alimentos

```dart
// lib/features/nutrition/providers/food_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

// Provider de todos los alimentos
final foodItemsProvider = StreamProvider<List<FoodItem>>((ref) {
  final isar = ref.watch(isarProvider).value!;
  return isar.foodItems
      .where()
      .sortByName()
      .watch(fireImmediately: true);
});

// Provider de alimentos favoritos
final favoriteFoodsProvider = StreamProvider<List<FoodItem>>((ref) {
  final isar = ref.watch(isarProvider).value!;
  return isar.foodItems
      .filter()
      .isFavoriteEqualTo(true)
      .sortByName()
      .watch(fireImmediately: true);
});

// Provider de alimentos por categoría
final foodsByCategoryProvider = Provider.family<AsyncValue<List<FoodItem>>, String>((ref, category) {
  final foodsAsync = ref.watch(foodItemsProvider);
  return foodsAsync.whenData(
    (foods) => foods.where((f) => f.category == category).toList(),
  );
});
```

---

### 6.2 Providers de comidas

```dart
// lib/features/nutrition/providers/meal_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider de todas las comidas
final mealsProvider = StreamProvider<List<Meal>>((ref) {
  final isar = ref.watch(isarProvider).value!;
  return isar.meals
      .where()
      .sortByTimestampDesc()
      .watch(fireImmediately: true);
});

// Provider de comidas de hoy
final todayMealsProvider = Provider<AsyncValue<List<Meal>>>((ref) {
  final mealsAsync = ref.watch(mealsProvider);
  
  return mealsAsync.whenData((meals) {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return meals.where((m) =>
      m.timestamp.isAfter(startOfDay.subtract(const Duration(milliseconds: 1))) &&
      m.timestamp.isBefore(endOfDay)
    ).toList();
  });
});

// Provider de comidas por tipo
final mealsByTypeProvider = Provider.family<List<Meal>, String>((ref, mealType) {
  final todayMeals = ref.watch(todayMealsProvider).value ?? [];
  return todayMeals.where((m) => m.mealType == mealType).toList();
});
```

---

### 6.3 Providers de nutrición general

```dart
// lib/features/nutrition/providers/nutrition_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Modelo para resumen nutricional
class NutritionSummary {
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFats;

  NutritionSummary({
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFats,
  });
}

// Provider de resumen de hoy
final todayNutritionSummaryProvider = Provider<NutritionSummary>((ref) {
  final todayMeals = ref.watch(todayMealsProvider).value ?? [];

  double totalCals = 0;
  double totalProtein = 0;
  double totalCarbs = 0;
  double totalFats = 0;

  for (var meal in todayMeals) {
    totalCals += meal.totalCalories;
    totalProtein += meal.totalProtein;
    totalCarbs += meal.totalCarbs;
    totalFats += meal.totalFats;
  }

  return NutritionSummary(
    totalCalories: totalCals,
    totalProtein: totalProtein,
    totalCarbs: totalCarbs,
    totalFats: totalFats,
  );
});

// Provider de meta nutricional de hoy
final todayNutritionGoalProvider = FutureProvider<NutritionGoal?>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  final today = DateTime.now();
  final todayMidnight = DateTime(today.year, today.month, today.day);

  return isar.nutritionGoals
      .filter()
      .dateEqualTo(todayMidnight)
      .findFirst();
});

// Provider de progreso de calorías
final calorieProgressProvider = Provider<double>((ref) {
  final summary = ref.watch(todayNutritionSummaryProvider);
  final goalAsync = ref.watch(todayNutritionGoalProvider);

  final goal = goalAsync.value?.targetCalories ?? 2000;
  return (summary.totalCalories / goal).clamp(0.0, 1.0);
});
```

---

## 🌱 7. SEED DATA (Alimentos predefinidos)

### 7.1 Service de seed

```dart
// lib/features/nutrition/services/nutrition_seeder.dart
import 'package:isar/isar.dart';

class NutritionSeeder {
  static Future<void> seedFoodDatabase(Isar isar) async {
    // Verificar si ya hay datos
    final count = await isar.foodItems.count();
    if (count > 0) {
      print('Database already seeded');
      return;
    }

    print('Seeding food database...');

    final foods = _getFoodSeedData();

    await isar.writeTxn(() async {
      for (var food in foods) {
        await isar.foodItems.put(food);
      }
    });

    print('Seeded ${foods.length} food items');
  }

  static List<FoodItem> _getFoodSeedData() {
    return [
      // ========== FRUTAS ==========
      _createFood(
        foodId: 'apple_001',
        name: 'Manzana',
        category: 'fruits',
        cals: 52, prot: 0.3, carbs: 14, fats: 0.2,
        servingUnit: 'pieza', servingGrams: 150,
      ),
      _createFood(
        foodId: 'banana_001',
        name: 'Plátano',
        category: 'fruits',
        cals: 89, prot: 1.1, carbs: 23, fats: 0.3,
        servingUnit: 'pieza', servingGrams: 120,
      ),
      _createFood(
        foodId: 'orange_001',
        name: 'Naranja',
        category: 'fruits',
        cals: 47, prot: 0.9, carbs: 12, fats: 0.1,
        servingUnit: 'pieza', servingGrams: 130,
      ),
      _createFood(
        foodId: 'strawberry_001',
        name: 'Fresas',
        category: 'fruits',
        cals: 32, prot: 0.7, carbs: 7.7, fats: 0.3,
        servingUnit: 'taza', servingGrams: 150,
      ),
      _createFood(
        foodId: 'watermelon_001',
        name: 'Sandía',
        category: 'fruits',
        cals: 30, prot: 0.6, carbs: 7.6, fats: 0.2,
        servingUnit: 'taza', servingGrams: 150,
      ),

      // ========== PROTEÍNAS ==========
      _createFood(
        foodId: 'chicken_breast_001',
        name: 'Pechuga de pollo (cocida)',
        category: 'protein',
        cals: 165, prot: 31, carbs: 0, fats: 3.6,
        servingUnit: 'porción', servingGrams: 120,
      ),
      _createFood(
        foodId: 'beef_ground_001',
        name: 'Carne molida (90% magra)',
        category: 'protein',
        cals: 176, prot: 20, carbs: 0, fats: 10,
        servingUnit: 'porción', servingGrams: 100,
      ),
      _createFood(
        foodId: 'salmon_001',
        name: 'Salmón (cocido)',
        category: 'protein',
        cals: 206, prot: 22, carbs: 0, fats: 13,
        servingUnit: 'filete', servingGrams: 100,
      ),
      _createFood(
        foodId: 'egg_001',
        name: 'Huevo entero',
        category: 'protein',
        cals: 155, prot: 13, carbs: 1.1, fats: 11,
        servingUnit: 'pieza', servingGrams: 50,
      ),
      _createFood(
        foodId: 'tuna_canned_001',
        name: 'Atún en agua (lata)',
        category: 'protein',
        cals: 116, prot: 26, carbs: 0, fats: 0.8,
        servingUnit: 'lata', servingGrams: 100,
      ),

      // ========== GRANOS ==========
      _createFood(
        foodId: 'rice_white_001',
        name: 'Arroz blanco (cocido)',
        category: 'grains',
        cals: 130, prot: 2.7, carbs: 28, fats: 0.3,
        servingUnit: 'taza', servingGrams: 200,
      ),
      _createFood(
        foodId: 'rice_brown_001',
        name: 'Arroz integral (cocido)',
        category: 'grains',
        cals: 111, prot: 2.6, carbs: 23, fats: 0.9,
        servingUnit: 'taza', servingGrams: 195,
      ),
      _createFood(
        foodId: 'pasta_001',
        name: 'Pasta (cocida)',
        category: 'grains',
        cals: 131, prot: 5, carbs: 25, fats: 1.1,
        servingUnit: 'taza', servingGrams: 140,
      ),
      _createFood(
        foodId: 'bread_whole_wheat_001',
        name: 'Pan integral',
        category: 'grains',
        cals: 247, prot: 13, carbs: 41, fats: 3.4,
        servingUnit: 'rebanada', servingGrams: 30,
      ),
      _createFood(
        foodId: 'oatmeal_001',
        name: 'Avena (seca)',
        category: 'grains',
        cals: 389, prot: 17, carbs: 66, fats: 7,
        servingUnit: 'taza', servingGrams: 80,
      ),

      // ========== VEGETALES ==========
      _createFood(
        foodId: 'broccoli_001',
        name: 'Brócoli (cocido)',
        category: 'vegetables',
        cals: 34, prot: 2.8, carbs: 7, fats: 0.4,
        servingUnit: 'taza', servingGrams: 150,
      ),
      _createFood(
        foodId: 'spinach_001',
        name: 'Espinacas (crudas)',
        category: 'vegetables',
        cals: 23, prot: 2.9, carbs: 3.6, fats: 0.4,
        servingUnit: 'taza', servingGrams: 100,
      ),
      _createFood(
        foodId: 'tomato_001',
        name: 'Tomate',
        category: 'vegetables',
        cals: 18, prot: 0.9, carbs: 3.9, fats: 0.2,
        servingUnit: 'pieza', servingGrams: 120,
      ),
      _createFood(
        foodId: 'lettuce_001',
        name: 'Lechuga',
        category: 'vegetables',
        cals: 15, prot: 1.4, carbs: 2.9, fats: 0.2,
        servingUnit: 'taza', servingGrams: 100,
      ),
      _createFood(
        foodId: 'carrot_001',
        name: 'Zanahoria',
        category: 'vegetables',
        cals: 41, prot: 0.9, carbs: 10, fats: 0.2,
        servingUnit: 'pieza', servingGrams: 60,
      ),

      // ========== LÁCTEOS ==========
      _createFood(
        foodId: 'milk_whole_001',
        name: 'Leche entera',
        category: 'dairy',
        cals: 61, prot: 3.2, carbs: 4.8, fats: 3.3,
        servingUnit: 'taza', servingGrams: 240,
      ),
      _createFood(
        foodId: 'milk_skim_001',
        name: 'Leche descremada',
        category: 'dairy',
        cals: 34, prot: 3.4, carbs: 5, fats: 0.2,
        servingUnit: 'taza', servingGrams: 240,
      ),
      _createFood(
        foodId: 'yogurt_greek_001',
        name: 'Yogurt griego natural',
        category: 'dairy',
        cals: 59, prot: 10, carbs: 3.6, fats: 0.4,
        servingUnit: 'taza', servingGrams: 170,
      ),
      _createFood(
        foodId: 'cheese_cheddar_001',
        name: 'Queso cheddar',
        category: 'dairy',
        cals: 403, prot: 25, carbs: 1.3, fats: 33,
        servingUnit: 'rebanada', servingGrams: 30,
      ),

      // ========== GRASAS ==========
      _createFood(
        foodId: 'avocado_001',
        name: 'Aguacate',
        category: 'fats',
        cals: 160, prot: 2, carbs: 8.5, fats: 15,
        servingUnit: 'pieza', servingGrams: 100,
      ),
      _createFood(
        foodId: 'almonds_001',
        name: 'Almendras',
        category: 'fats',
        cals: 579, prot: 21, carbs: 22, fats: 50,
        servingUnit: 'puñado', servingGrams: 30,
      ),
      _createFood(
        foodId: 'peanut_butter_001',
        name: 'Mantequilla de maní',
        category: 'fats',
        cals: 588, prot: 25, carbs: 20, fats: 50,
        servingUnit: 'cucharada', servingGrams: 15,
      ),
      _createFood(
        foodId: 'olive_oil_001',
        name: 'Aceite de oliva',
        category: 'fats',
        cals: 884, prot: 0, carbs: 0, fats: 100,
        servingUnit: 'cucharada', servingGrams: 15,
      ),

      // ========== SNACKS ==========
      _createFood(
        foodId: 'protein_bar_001',
        name: 'Barra de proteína',
        category: 'snacks',
        cals: 200, prot: 20, carbs: 15, fats: 6,
        servingUnit: 'pieza', servingGrams: 60,
      ),
      _createFood(
        foodId: 'protein_shake_001',
        name: 'Proteína en polvo (whey)',
        category: 'snacks',
        cals: 120, prot: 24, carbs: 3, fats: 1.5,
        servingUnit: 'scoop', servingGrams: 30,
      ),

      // Agregar más hasta llegar a 100+...
    ];
  }

  static FoodItem _createFood({
    required String foodId,
    required String name,
    required String category,
    required double cals,
    required double prot,
    required double carbs,
    required double fats,
    String? servingUnit,
    double? servingGrams,
  }) {
    return FoodItem()
      ..foodId = foodId
      ..name = name
      ..category = category
      ..caloriesPer100g = cals
      ..proteinPer100g = prot
      ..carbsPer100g = carbs
      ..fatsPer100g = fats
      ..servingUnit = servingUnit
      ..servingSizeGrams = servingGrams
      ..isCustom = false
      ..isFavorite = false
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }
}
```

**Llamar el seeder en init de la app:**
```dart
// En main.dart o en initState de la app
await NutritionSeeder.seedFoodDatabase(isar);
```

---

## 🧮 8. SERVICES

### 8.1 MacroCalculatorService

```dart
// lib/features/nutrition/services/macro_calculator_service.dart

class MacroCalculatorService {
  /// Calcula macros totales de una comida
  static Future<Map<String, double>> calculateMealMacros({
    required List<String> foodItemIds,
    required List<double> portionSizesGrams,
    required Isar isar,
  }) async {
    double totalCals = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFats = 0;

    for (int i = 0; i < foodItemIds.length; i++) {
      final food = await isar.foodItems
          .filter()
          .foodIdEqualTo(foodItemIds[i])
          .findFirst();

      if (food != null) {
        final factor = portionSizesGrams[i] / 100;
        totalCals += food.caloriesPer100g * factor;
        totalProtein += food.proteinPer100g * factor;
        totalCarbs += food.carbsPer100g * factor;
        totalFats += food.fatsPer100g * factor;
      }
    }

    return {
      'calories': totalCals,
      'protein': totalProtein,
      'carbs': totalCarbs,
      'fats': totalFats,
    };
  }

  /// Calcula meta diaria basada en perfil de usuario
  static NutritionGoal calculateDailyGoal({
    required double weightKg,
    required double heightCm,
    required int age,
    required String gender,
    required String activityLevel,
    required String goal, // 'lose', 'maintain', 'gain'
  }) {
    // Fórmula de Harris-Benedict para TDEE
    double bmr;
    if (gender == 'male') {
      bmr = 88.362 + (13.397 * weightKg) + (4.799 * heightCm) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weightKg) + (3.098 * heightCm) - (4.330 * age);
    }

    // Multiplicador de actividad
    double activityMultiplier;
    switch (activityLevel) {
      case 'sedentary': activityMultiplier = 1.2; break;
      case 'light': activityMultiplier = 1.375; break;
      case 'moderate': activityMultiplier = 1.55; break;
      case 'very_active': activityMultiplier = 1.725; break;
      case 'extra_active': activityMultiplier = 1.9; break;
      default: activityMultiplier = 1.55;
    }

    double tdee = bmr * activityMultiplier;

    // Ajustar según objetivo
    double targetCalories;
    switch (goal) {
      case 'lose': targetCalories = tdee - 500; break; // Déficit de 500 kcal
      case 'gain': targetCalories = tdee + 300; break; // Superávit de 300 kcal
      case 'maintain':
      default: targetCalories = tdee;
    }

    // Calcular macros (40/30/30 como default)
    final proteinG = (targetCalories * 0.30 / 4).round(); // 4 kcal/g
    final carbsG = (targetCalories * 0.40 / 4).round();
    final fatsG = (targetCalories * 0.30 / 9).round(); // 9 kcal/g

    return NutritionGoal()
      ..date = DateTime.now()
      ..targetCalories = targetCalories.round()
      ..targetProteinG = proteinG
      ..targetCarbsG = carbsG
      ..targetFatsG = fatsG
      ..source = 'auto_calculated'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }
}
```

---

## ✅ 9. CRITERIOS DE ACEPTACIÓN

El módulo de nutrición se considera **completo** cuando:

### Core functionality:
- [ ] Se pueden registrar comidas en las 4 categorías
- [ ] Se calculan macros correctamente
- [ ] Base de datos con 100+ alimentos funciona
- [ ] Se pueden crear alimentos custom
- [ ] Se pueden crear y usar recetas
- [ ] Meta diaria se calcula automáticamente

### UI/UX:
- [ ] Dashboard muestra progreso en tiempo real
- [ ] Macro ring chart se renderiza correctamente
- [ ] Registro de comida toma <30 segundos
- [ ] Todas las pantallas siguen el theme actual
- [ ] Navegación fluida sin crashes

### Datos:
- [ ] Todo persiste en Isar correctamente
- [ ] Providers actualizan UI en tiempo real
- [ ] Queries de Isar optimizadas (<50ms)
- [ ] Seed data completo funciona

### Integración:
- [ ] Se integra con módulo de Fitness (calorías)
- [ ] Dashboard principal muestra resumen nutricional
- [ ] No rompe funcionalidad de módulo de Hidratación

---

## 🚀 10. PLAN DE IMPLEMENTACIÓN

### Semana 1: Fundación
- Día 1-2: Modelos de datos + build_runner
- Día 3-4: Seed de alimentos
- Día 5: Providers básicos

### Semana 2: Core UI
- Día 1-2: NutritionHome + MacroRingChart
- Día 3-4: MealLogScreen
- Día 5: FoodDatabaseScreen

### Semana 3: Features avanzadas
- Día 1-2: Sistema de recetas
- Día 3-4: Historial y gráficas
- Día 5: Settings y metas

### Semana 4: Polish & Testing
- Día 1-2: Widgets faltantes
- Día 3-4: Testing integral
- Día 5: Optimización y docs

---

## 📝 11. NOTAS TÉCNICAS

### Performance:
- Denormalizar datos (ej: `foodItemNames` en `Meal`) para queries rápidas
- Usar índices en campos de búsqueda frecuente
- Cachear cálculos pesados

### Futuras mejoras (post v3.0):
- Escaneo de códigos de barras
- Integración con API de alimentos (USDA, Open Food Facts)
- Fotos de comidas con IA
- Análisis nutricional semanal/mensual
- Recomendaciones personalizadas

---

**FIN DEL DOCUMENTO**
