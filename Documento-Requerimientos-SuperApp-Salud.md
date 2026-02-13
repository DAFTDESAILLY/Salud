# 📄 DOCUMENTO DE REQUERIMIENTOS TÉCNICOS
## Proyecto: Sistema Personal de Optimización Física - Plataforma Multi-Módulo
**Versión:** 3.0 - Super App  
**Fecha:** Febrero 2026  
**Estado:** Diseño arquitectónico  
**Arquitectura:** Flutter + Riverpod + Isar (Offline-first)

---

## 1️⃣ VISIÓN DEL PROYECTO

### 1.1 Propósito
Transformar la aplicación actual de hidratación en una **plataforma unificada de salud personal** que integre tres pilares fundamentales:
- 💧 **Hidratación** (módulo existente)
- 💪 **Fitness** (nuevo)
- 🍎 **Nutrición** (nuevo)

### 1.2 Objetivo estratégico
Crear un ecosistema modular donde cada feature:
- Opera de forma independiente
- Comparte datos cuando es relevante
- Mantiene consistencia de UX
- Funciona 100% offline

---

## 2️⃣ ALCANCE

### ✅ Incluido en v3.0

**Core unificado:**
- Sistema de autenticación/onboarding
- Perfil de usuario centralizado
- Dashboard multi-módulo
- Navegación entre módulos
- Tema y diseño consistente

**Módulo Agua (migración):**
- Mantener toda funcionalidad actual
- Integrar en nueva arquitectura
- Compartir datos con otros módulos

**Módulo Fitness (nuevo):**
- Registro de ejercicios
- Biblioteca de rutinas
- Tracking de progreso
- Historial de entrenamientos

**Módulo Food (nuevo):**
- Registro de comidas
- Contador de calorías
- Macronutrientes básicos
- Recetas guardadas

**Integraciones cruzadas:**
- Agua + Fitness: ajuste de meta por actividad
- Food + Fitness: calorías consumidas vs quemadas
- Dashboard unificado con todos los datos

### ❌ No incluido en v3.0
- Backend/sincronización en nube
- Multi-usuario
- Integración con APIs externas de alimentos
- Escaneo de códigos de barras
- Wearables/smartwatch
- Gamificación completa
- Análisis médico/recomendaciones de salud

---

## 3️⃣ ARQUITECTURA TÉCNICA

### 3.1 Estructura de carpetas

```
lib/
├── main.dart
├── app.dart                     # MaterialApp configuración
│
├── core/                        # Compartido entre módulos
│   ├── auth/
│   │   ├── models/
│   │   │   ├── user_profile.dart
│   │   │   └── user_profile.g.dart
│   │   ├── providers/
│   │   │   └── auth_providers.dart
│   │   └── screens/
│   │       ├── welcome_screen.dart
│   │       └── onboarding_screen.dart
│   │
│   ├── database/
│   │   ├── isar_service.dart
│   │   └── collections.dart     # Registro central de colecciones
│   │
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   └── text_styles.dart
│   │
│   ├── navigation/
│   │   ├── app_router.dart
│   │   └── bottom_nav_bar.dart
│   │
│   └── widgets/
│       ├── custom_button.dart
│       ├── empty_state.dart
│       └── loading_indicator.dart
│
├── features/
│   ├── dashboard/               # Hub central
│   │   ├── screens/
│   │   │   └── home_dashboard.dart
│   │   ├── widgets/
│   │   │   ├── module_card.dart
│   │   │   └── daily_summary.dart
│   │   └── providers/
│   │       └── dashboard_providers.dart
│   │
│   ├── hydration/               # ✅ Ya existe - migrar
│   │   ├── models/
│   │   ├── providers/
│   │   ├── screens/
│   │   ├── services/
│   │   └── widgets/
│   │
│   ├── fitness/                 # 🆕 Nuevo módulo
│   │   ├── models/
│   │   │   ├── exercise.dart
│   │   │   ├── exercise.g.dart
│   │   │   ├── workout.dart
│   │   │   ├── workout.g.dart
│   │   │   ├── routine.dart
│   │   │   └── routine.g.dart
│   │   ├── providers/
│   │   │   ├── exercise_providers.dart
│   │   │   └── workout_providers.dart
│   │   ├── screens/
│   │   │   ├── fitness_home.dart
│   │   │   ├── workout_log_screen.dart
│   │   │   ├── exercise_library.dart
│   │   │   └── workout_history.dart
│   │   ├── services/
│   │   │   └── calorie_calculator.dart
│   │   └── widgets/
│   │       ├── exercise_card.dart
│   │       ├── workout_timer.dart
│   │       └── progress_chart.dart
│   │
│   └── nutrition/               # 🆕 Nuevo módulo
│       ├── models/
│       │   ├── meal.dart
│       │   ├── meal.g.dart
│       │   ├── food_item.dart
│       │   ├── food_item.g.dart
│       │   ├── recipe.dart
│       │   └── recipe.g.dart
│       ├── providers/
│       │   ├── meal_providers.dart
│       │   └── nutrition_providers.dart
│       ├── screens/
│       │   ├── nutrition_home.dart
│       │   ├── meal_log_screen.dart
│       │   ├── food_search.dart
│       │   └── recipes_screen.dart
│       ├── services/
│       │   └── macro_calculator.dart
│       └── widgets/
│           ├── meal_card.dart
│           ├── macro_ring.dart
│           └── calorie_counter.dart
│
└── shared/                      # Utilidades compartidas
    ├── constants/
    │   ├── app_constants.dart
    │   └── exercise_types.dart
    ├── extensions/
    │   ├── datetime_extensions.dart
    │   └── number_extensions.dart
    └── utils/
        ├── date_helper.dart
        └── format_helper.dart
```

---

## 4️⃣ MODELOS DE DATOS

### 4.1 Core - User Profile

```dart
@collection
class UserProfile {
  Id id = Isar.autoIncrement;
  
  // Información básica
  String name;
  DateTime? dateOfBirth;
  String? gender; // 'male', 'female', 'other'
  
  // Métricas físicas
  double? weightKg;
  double? heightCm;
  
  // Preferencias
  bool usesMetricSystem;
  bool darkModeEnabled;
  String language; // 'es', 'en'
  
  // Control
  DateTime createdAt;
  DateTime updatedAt;
  
  // Onboarding
  bool hasCompletedOnboarding;
  List<String> enabledModules; // ['hydration', 'fitness', 'nutrition']
}
```

### 4.2 Módulo Fitness

**Exercise** (biblioteca de ejercicios)
```dart
@collection
class Exercise {
  Id id = Isar.autoIncrement;
  
  String name; // "Push-ups", "Squat"
  String category; // 'strength', 'cardio', 'flexibility', 'sport'
  String? subcategory; // 'chest', 'legs', 'core'
  
  // Métricas por defecto
  String primaryMetric; // 'reps', 'duration', 'distance'
  double? avgCaloriesPerUnit; // kcal por rep/min/km
  
  // Metadata
  String? description;
  String? instructions;
  bool isCustom; // creado por usuario vs predefinido
  
  DateTime createdAt;
}
```

**Workout** (sesión de entrenamiento)
```dart
@collection
class Workout {
  Id id = Isar.autoIncrement;
  
  DateTime startTime;
  DateTime? endTime;
  int durationMinutes;
  
  // Relación con ejercicios
  List<String> exerciseNames; // Array de nombres
  List<int> sets; // Sets por ejercicio
  List<int> reps; // Reps por set (promedio)
  List<double> weights; // Peso en kg (si aplica)
  
  // Métricas calculadas
  double totalCaloriesBurned;
  String workoutType; // 'strength', 'cardio', 'mixed'
  
  // Notas
  String? notes;
  int intensityLevel; // 1-10
  
  DateTime createdAt;
}
```

**Routine** (rutina guardada)
```dart
@collection
class Routine {
  Id id = Isar.autoIncrement;
  
  String name;
  String? description;
  
  List<String> exerciseIds; // Referencias a Exercise
  List<int> targetSets;
  List<int> targetReps;
  
  String frequency; // 'daily', 'weekly', 'custom'
  List<int>? scheduledDays; // 1=Mon, 7=Sun
  
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
}
```

### 4.3 Módulo Nutrition

**FoodItem** (alimento individual)
```dart
@collection
class FoodItem {
  Id id = Isar.autoIncrement;
  
  String name;
  String category; // 'protein', 'carbs', 'vegetables', 'fruits', 'dairy'
  
  // Por 100g
  double caloriesPer100g;
  double proteinPer100g;
  double carbsPer100g;
  double fatsPer100g;
  
  // Tamaño de porción común
  String? servingUnit; // 'unidad', 'taza', 'cucharada'
  double? servingSizeGrams;
  
  bool isCustom;
  DateTime createdAt;
}
```

**Meal** (comida registrada)
```dart
@collection
class Meal {
  Id id = Isar.autoIncrement;
  
  DateTime timestamp;
  String mealType; // 'breakfast', 'lunch', 'dinner', 'snack'
  
  // Alimentos de esta comida
  List<String> foodItemNames;
  List<double> portionSizesGrams;
  
  // Totales calculados
  double totalCalories;
  double totalProtein;
  double totalCarbs;
  double totalFats;
  
  String? notes;
  DateTime createdAt;
}
```

**Recipe** (receta guardada)
```dart
@collection
class Recipe {
  Id id = Isar.autoIncrement;
  
  String name;
  String? description;
  
  // Ingredientes
  List<String> ingredientNames;
  List<double> ingredientAmounts;
  List<String> ingredientUnits;
  
  // Instrucciones
  List<String> steps;
  
  // Métricas totales
  int servings;
  double caloriesPerServing;
  
  // Metadata
  String? imageUrl; // Local o URL
  List<String>? tags; // 'vegetarian', 'high-protein'
  
  bool isFavorite;
  DateTime createdAt;
}
```

---

## 5️⃣ FLUJOS DE USUARIO

### 5.1 Primera vez (Onboarding)

```
1. Pantalla de bienvenida
   ↓
2. Ingreso de nombre
   ↓
3. Selección de módulos a activar
   [✓] Agua  [✓] Fitness  [✓] Nutrición
   ↓
4. Configuración básica por módulo:
   - Agua: peso, actividad
   - Fitness: objetivos (fuerza/cardio/peso)
   - Nutrición: meta calórica, restricciones
   ↓
5. Dashboard principal
```

### 5.2 Dashboard principal

```
┌─────────────────────────────────┐
│  Hola, [Nombre] 👋              │
│  Hoy es [Fecha]                 │
├─────────────────────────────────┤
│                                 │
│  📊 Resumen del Día             │
│  ├─ 💧 Agua: 1.2L / 2.5L       │
│  ├─ 💪 Ejercicio: 45 min       │
│  └─ 🍎 Calorías: 1800 / 2200   │
│                                 │
├─────────────────────────────────┤
│                                 │
│  [Card: Módulo Agua]            │
│  [Card: Módulo Fitness]         │
│  [Card: Módulo Food]            │
│                                 │
└─────────────────────────────────┘

BottomNav: [ 🏠 Home ] [ 💧 Agua ] [ 💪 Fitness ] [ 🍎 Food ] [ ⚙️ Settings ]
```

### 5.3 Navegación entre módulos

**Opción A: Bottom Navigation Bar** (recomendada)
- 5 tabs fijas
- Acceso directo sin menú adicional
- Estado preservado al cambiar tabs

**Opción B: Drawer lateral**
- Más espacio en pantalla
- Mejor para >5 módulos futuros

---

## 6️⃣ FUNCIONALIDADES POR MÓDULO

### 6.1 Módulo Agua (migrado)

**Mantener:**
- Dashboard de progreso
- Registro rápido de bebidas
- Configuración de coeficientes
- Historial semanal
- Estadísticas por tipo de bebida

**Nuevo:**
- Integración con módulo Fitness
  - Detectar entrenamientos del día
  - Ajustar meta automáticamente (+500ml por cada 30min de cardio)

### 6.2 Módulo Fitness

#### Funcionalidades core:

**1. Registro de entrenamientos**
- Iniciar sesión de workout
- Timer integrado
- Agregar ejercicios de biblioteca
- Registrar sets/reps/peso
- Finalizar y calcular calorías

**2. Biblioteca de ejercicios**
- 50+ ejercicios predefinidos
- Categorías: Fuerza, Cardio, Flexibilidad, Deportes
- Buscar y filtrar
- Crear ejercicios custom

**3. Rutinas guardadas**
- Crear rutina personalizada
- Guardar ejercicios favoritos
- Quick-start desde rutina
- Programar días de la semana

**4. Historial**
- Calendario de entrenamientos
- Gráficas de progreso
- Total calorías quemadas
- Tiempo total entrenado

#### Cálculo de calorías (simplificado):

```dart
// Fórmula básica MET (Metabolic Equivalent)
caloriesBurned = MET × weightKg × durationHours

Ejemplos de MET:
- Push-ups: 8.0
- Running 8km/h: 8.3
- Cycling moderate: 6.8
- Yoga: 2.5
```

### 6.3 Módulo Nutrición

#### Funcionalidades core:

**1. Registro de comidas**
- 4 categorías: Desayuno, Comida, Cena, Snacks
- Agregar alimentos
- Especificar porciones
- Ver totales del día

**2. Base de datos de alimentos**
- 100+ alimentos comunes predefinidos
- Macros por 100g
- Buscar y filtrar
- Agregar alimentos custom

**3. Contador de macros**
- Meta calórica diaria
- Distribución: Proteína / Carbos / Grasas
- Visualización con anillos o barras
- Progreso en tiempo real

**4. Recetas**
- Guardar recetas favoritas
- Calcular macros totales
- Porciones ajustables
- Notas e instrucciones

**5. Historial**
- Calendario de comidas
- Promedio semanal de macros
- Tendencias de consumo

---

## 7️⃣ INTEGRACIONES CRUZADAS

### 7.1 Agua ↔ Fitness

**Escenario:** Usuario registra entrenamiento de 45 min cardio

```dart
// En workout_providers.dart
void onWorkoutCompleted(Workout workout) {
  // Notificar a módulo de hidratación
  if (workout.workoutType == 'cardio') {
    final extraWater = (workout.durationMinutes / 30) * 500; // 500ml por 30min
    ref.read(hydrationGoalProvider.notifier).addExtraGoal(extraWater);
  }
}
```

**UI:**
```
💧 Meta de agua ajustada
Tu entrenamiento de 45 min requiere +750ml adicionales
Nueva meta: 3.25L
```

### 7.2 Food ↔ Fitness

**Escenario:** Usuario quiere ver balance calórico

```dart
// En dashboard_providers.dart
int getDailyCalorieBalance() {
  final consumed = ref.watch(totalCaloriesConsumedTodayProvider);
  final burned = ref.watch(totalCaloriesBurnedTodayProvider);
  final basalRate = calculateBMR(); // Tasa metabólica basal
  
  return consumed - (burned + basalRate);
}
```

**UI:**
```
📊 Balance calórico del día
Consumido: 2100 kcal
Quemado: 2300 kcal (1800 basal + 500 ejercicio)
Balance: -200 kcal (déficit)
```

### 7.3 Dashboard unificado

**Cálculo de "score diario":**
```dart
double getDailyHealthScore() {
  final waterScore = (currentWater / goalWater).clamp(0.0, 1.0);
  final exerciseScore = (minutesExercised / 30).clamp(0.0, 1.0); // 30min target
  final nutritionScore = abs(calorieBalance) < 300 ? 1.0 : 0.5;
  
  return ((waterScore + exerciseScore + nutritionScore) / 3) * 100;
}
```

---

## 8️⃣ PROVIDERS (Riverpod)

### 8.1 Providers compartidos

```dart
// lib/core/auth/providers/auth_providers.dart

final userProfileProvider = StreamProvider<UserProfile?>((ref) {
  final isar = ref.watch(isarServiceProvider);
  return isar.userProfiles.watchObject(1);
});

final isOnboardingCompleteProvider = Provider<bool>((ref) {
  final user = ref.watch(userProfileProvider).value;
  return user?.hasCompletedOnboarding ?? false;
});
```

### 8.2 Providers de Fitness

```dart
// lib/features/fitness/providers/workout_providers.dart

final workoutsProvider = StreamProvider<List<Workout>>((ref) {
  final isar = ref.watch(isarServiceProvider);
  return isar.workouts.where().sortByStartTimeDesc().watch(fireImmediately: true);
});

final todayWorkoutsProvider = Provider<List<Workout>>((ref) {
  final workouts = ref.watch(workoutsProvider).value ?? [];
  final today = DateTime.now();
  return workouts.where((w) => 
    w.startTime.year == today.year &&
    w.startTime.month == today.month &&
    w.startTime.day == today.day
  ).toList();
});

final totalCaloriesBurnedTodayProvider = Provider<double>((ref) {
  final todayWorkouts = ref.watch(todayWorkoutsProvider);
  return todayWorkouts.fold(0.0, (sum, w) => sum + w.totalCaloriesBurned);
});
```

### 8.3 Providers de Nutrition

```dart
// lib/features/nutrition/providers/meal_providers.dart

final mealsProvider = StreamProvider<List<Meal>>((ref) {
  final isar = ref.watch(isarServiceProvider);
  return isar.meals.where().sortByTimestampDesc().watch(fireImmediately: true);
});

final todayMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider).value ?? [];
  final today = DateTime.now();
  return meals.where((m) => 
    m.timestamp.year == today.year &&
    m.timestamp.month == today.month &&
    m.timestamp.day == today.day
  ).toList();
});

final totalCaloriesConsumedTodayProvider = Provider<double>((ref) {
  final todayMeals = ref.watch(todayMealsProvider);
  return todayMeals.fold(0.0, (sum, m) => sum + m.totalCalories);
});

final todayMacrosProvider = Provider<Map<String, double>>((ref) {
  final todayMeals = ref.watch(todayMealsProvider);
  return {
    'protein': todayMeals.fold(0.0, (sum, m) => sum + m.totalProtein),
    'carbs': todayMeals.fold(0.0, (sum, m) => sum + m.totalCarbs),
    'fats': todayMeals.fold(0.0, (sum, m) => sum + m.totalFats),
  };
});
```

---

## 9️⃣ MIGRACIÓN DEL MÓDULO AGUA

### 9.1 Cambios estructurales

**Antes (v2.x):**
```
lib/
├── main.dart
└── features/
    └── hydration/
```

**Después (v3.0):**
```
lib/
├── main.dart
├── core/              # Nuevo
└── features/
    ├── dashboard/     # Nuevo
    ├── hydration/     # Migrar aquí
    ├── fitness/       # Nuevo
    └── nutrition/     # Nuevo
```

### 9.2 Pasos de migración

1. **Crear estructura core**
   ```bash
   mkdir -p lib/core/{auth,database,theme,navigation,widgets}
   ```

2. **Mover UserProfile a core**
   ```bash
   mv lib/core/models/user_profile.dart lib/core/auth/models/
   ```

3. **Actualizar imports**
   ```dart
   // Antes:
   import '../../../core/models/user_profile.dart';
   
   // Después:
   import '../../../../core/auth/models/user_profile.dart';
   ```

4. **Agregar campos a UserProfile**
   ```dart
   // Nuevos campos:
   List<String> enabledModules;
   bool hasCompletedOnboarding;
   ```

5. **Mantener providers existentes**
   - No cambiar lógica interna
   - Solo ajustar paths de imports

---

## 🔟 UI/UX GUIDELINES

### 10.1 Paleta de colores por módulo

```dart
// lib/core/theme/app_colors.dart

class AppColors {
  // Módulo Agua
  static const waterPrimary = Color(0xFF2196F3);
  static const waterAccent = Color(0xFF64B5F6);
  
  // Módulo Fitness
  static const fitnessPrimary = Color(0xFFFF5722);
  static const fitnessAccent = Color(0xFFFF8A65);
  
  // Módulo Nutrition
  static const nutritionPrimary = Color(0xFF4CAF50);
  static const nutritionAccent = Color(0xFF81C784);
  
  // Compartido
  static const backgroundDark = Color(0xFF121212);
  static const cardDark = Color(0xFF1E1E1E);
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB0B0B0);
}
```

### 10.2 Componentes reutilizables

**ModuleCard** (para dashboard)
```dart
class ModuleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String subtitle;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardDark,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 32),
                  SizedBox(width: 12),
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Text(subtitle, style: TextStyle(color: AppColors.textSecondary)),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 10.3 Navegación consistente

**Bottom Navigation Bar:**
```dart
// lib/core/navigation/bottom_nav_bar.dart

class AppBottomNavBar extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);
    
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => ref.read(navigationIndexProvider.notifier).state = index,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.cardDark,
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColors.textSecondary,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'Agua'),
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Fitness'),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Comida'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
      ],
    );
  }
}
```

---

## 1️⃣1️⃣ PLAN DE IMPLEMENTACIÓN

### Fase 1: Preparación (Semana 1)
- [ ] Crear nueva estructura de carpetas
- [ ] Implementar core (auth, navigation, theme)
- [ ] Crear modelos base de UserProfile extendido
- [ ] Diseñar screens de onboarding
- [ ] Setup de Bottom Navigation

### Fase 2: Migración Agua (Semana 2)
- [ ] Mover código de hydration a nueva estructura
- [ ] Actualizar todos los imports
- [ ] Agregar integración con dashboard
- [ ] Testing de funcionalidad existente
- [ ] Crear migration script si hay cambios en BD

### Fase 3: Módulo Fitness (Semana 3-4)
- [ ] Crear modelos (Exercise, Workout, Routine)
- [ ] Implementar providers
- [ ] Build UI: Home, Logger, Library, History
- [ ] Implementar calculadora de calorías
- [ ] Testing e integración con Agua

### Fase 4: Módulo Nutrition (Semana 5-6)
- [ ] Crear modelos (FoodItem, Meal, Recipe)
- [ ] Seed de 100 alimentos base
- [ ] Implementar providers
- [ ] Build UI: Home, Logger, Search, Recipes
- [ ] Calculadora de macros
- [ ] Testing e integración con Fitness

### Fase 5: Dashboard & Polish (Semana 7)
- [ ] Implementar dashboard unificado
- [ ] Widgets de resumen cruzado
- [ ] Health score calculation
- [ ] Ajustes de diseño
- [ ] Testing integral
- [ ] Optimización de performance

### Fase 6: Testing & Release (Semana 8)
- [ ] Testing manual completo
- [ ] Edge cases
- [ ] Performance profiling
- [ ] Documentación de usuario
- [ ] Preparar assets de store
- [ ] Release candidate

---

## 1️⃣2️⃣ DEPENDENCIAS ADICIONALES

```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_riverpod: ^2.4.0
  
  # Database
  isar: ^3.1.0
  isar_flutter_libs: ^3.1.0
  
  # Navigation
  go_router: ^13.0.0  # Opcional si quieres routing avanzado
  
  # UI
  fl_chart: ^0.66.0  # Para gráficas
  intl: ^0.18.0      # Formateo de fechas/números
  
  # Utilities
  path_provider: ^2.1.0

dev_dependencies:
  build_runner: ^2.4.0
  isar_generator: ^3.1.0
  flutter_lints: ^3.0.0
```

---

## 1️⃣3️⃣ CONSIDERACIONES DE PERFORMANCE

### 13.1 Isar Queries optimizadas

```dart
// ❌ Malo: Cargar todo y filtrar en Dart
final allWorkouts = await isar.workouts.where().findAll();
final today = allWorkouts.where((w) => isToday(w.startTime)).toList();

// ✅ Bueno: Filtrar en la DB
final today = await isar.workouts
  .filter()
  .startTimeBetween(startOfDay, endOfDay)
  .findAll();
```

### 13.2 Lazy loading

```dart
// Para listas largas, usar pagination
final workouts = await isar.workouts
  .where()
  .offset(page * 20)
  .limit(20)
  .findAll();
```

### 13.3 Computed properties

```dart
// Calcular en el modelo, no en UI
class Meal {
  // ...
  
  double get totalCalories => 
    foodItemNames.indexed.fold(0.0, (sum, item) {
      final (index, name) = item;
      return sum + (foodCalories[index] * portionSizes[index] / 100);
    });
}
```

---

## 1️⃣4️⃣ TESTING STRATEGY

### 14.1 Unit tests

```dart
// test/features/fitness/services/calorie_calculator_test.dart

void main() {
  group('CalorieCalculator', () {
    test('should calculate calories for cardio', () {
      final calories = CalorieCalculator.calculate(
        met: 8.0,
        weightKg: 70,
        durationMinutes: 30,
      );
      
      expect(calories, 280.0); // 8 * 70 * 0.5
    });
  });
}
```

### 14.2 Widget tests

```dart
// test/features/dashboard/home_dashboard_test.dart

void main() {
  testWidgets('Dashboard shows all modules', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomeDashboard()),
      ),
    );
    
    expect(find.text('Agua'), findsOneWidget);
    expect(find.text('Fitness'), findsOneWidget);
    expect(find.text('Nutrición'), findsOneWidget);
  });
}
```

### 14.3 Integration tests

```dart
// integration_test/user_flow_test.dart

void main() {
  testWidgets('Complete user flow', (tester) async {
    // 1. Complete onboarding
    // 2. Log water
    // 3. Log workout
    // 4. Log meal
    // 5. Check dashboard updates
  });
}
```

---

## 1️⃣5️⃣ CRITERIOS DE ACEPTACIÓN

La versión 3.0 se considera **completa y lista para release** cuando:

### Core:
- [x] Onboarding funcional con selección de módulos
- [x] UserProfile centralizado guardando correctamente
- [x] Navegación entre módulos sin pérdida de estado
- [x] Tema consistente en toda la app

### Módulo Agua:
- [x] Toda funcionalidad v2.x funciona correctamente
- [x] Integración con Fitness (ajuste de meta)
- [x] Visible desde dashboard

### Módulo Fitness:
- [x] Registrar workout completo
- [x] Biblioteca de >50 ejercicios
- [x] Calcular calorías quemadas
- [x] Ver historial en calendario
- [x] Crear y usar rutinas

### Módulo Nutrition:
- [x] Registrar comidas en 4 categorías
- [x] Base de >100 alimentos
- [x] Calcular macros en tiempo real
- [x] Guardar recetas
- [x] Ver historial semanal

### Dashboard:
- [x] Resumen diario de 3 módulos
- [x] Health score calculado
- [x] Acceso rápido a cada módulo
- [x] Datos actualizados en tiempo real

### Calidad:
- [x] 0 crashes en testing manual
- [x] Performance fluida (<16ms frame time)
- [x] Funciona 100% offline
- [x] Data persiste correctamente

---

## 1️⃣6️⃣ ROADMAP FUTURO (Post v3.0)

### v3.1 - Notificaciones
- Push notifications para recordatorios
- Smart scheduling basado en patrones

### v3.2 - Gamificación
- Sistema de logros
- Streaks y challenges
- Niveles de progreso

### v3.3 - Integraciones
- Apple Health / Google Fit
- Export de datos (CSV, PDF)

### v3.4 - Social
- Compartir logros
- Grupos de amigos

### v4.0 - Cloud
- Backend con sincronización
- Multi-dispositivo
- Backup automático

---

## 📋 APÉNDICE

### A. Seed Data - Ejercicios predefinidos

```dart
final defaultExercises = [
  // Fuerza - Pecho
  Exercise(name: 'Push-ups', category: 'strength', subcategory: 'chest', primaryMetric: 'reps', avgCaloriesPerUnit: 0.5),
  Exercise(name: 'Bench Press', category: 'strength', subcategory: 'chest', primaryMetric: 'reps', avgCaloriesPerUnit: 0.6),
  
  // Fuerza - Piernas
  Exercise(name: 'Squats', category: 'strength', subcategory: 'legs', primaryMetric: 'reps', avgCaloriesPerUnit: 0.8),
  Exercise(name: 'Lunges', category: 'strength', subcategory: 'legs', primaryMetric: 'reps', avgCaloriesPerUnit: 0.6),
  
  // Cardio
  Exercise(name: 'Running', category: 'cardio', primaryMetric: 'duration', avgCaloriesPerUnit: 10.0), // por minuto
  Exercise(name: 'Cycling', category: 'cardio', primaryMetric: 'duration', avgCaloriesPerUnit: 8.0),
  
  // ... más ejercicios
];
```

### B. Seed Data - Alimentos comunes

```dart
final defaultFoods = [
  // Proteínas
  FoodItem(name: 'Pechuga de pollo', category: 'protein', caloriesPer100g: 165, proteinPer100g: 31, carbsPer100g: 0, fatsPer100g: 3.6),
  FoodItem(name: 'Huevo', category: 'protein', caloriesPer100g: 155, proteinPer100g: 13, carbsPer100g: 1.1, fatsPer100g: 11),
  
  // Carbohidratos
  FoodItem(name: 'Arroz blanco cocido', category: 'carbs', caloriesPer100g: 130, proteinPer100g: 2.7, carbsPer100g: 28, fatsPer100g: 0.3),
  FoodItem(name: 'Pasta cocida', category: 'carbs', caloriesPer100g: 131, proteinPer100g: 5, carbsPer100g: 25, fatsPer100g: 1.1),
  
  // Vegetales
  FoodItem(name: 'Brócoli', category: 'vegetables', caloriesPer100g: 34, proteinPer100g: 2.8, carbsPer100g: 7, fatsPer100g: 0.4),
  
  // ... más alimentos
];
```

---

## 📞 CONTACTO Y REVISIÓN

**Autor:** Sistema de análisis técnico  
**Última actualización:** Febrero 2026  
**Próxima revisión:** Después de Fase 1

**Para cambios o dudas:**
- Revisar este documento antes de empezar cada fase
- Actualizar secciones según descubrimientos durante desarrollo
- Mantener sincronizado con código real

---

**FIN DEL DOCUMENTO**
