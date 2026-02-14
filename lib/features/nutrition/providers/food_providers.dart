import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:daftfits/features/nutrition/models/food_item.dart';
import 'package:daftfits/features/nutrition/services/nutrition_seeder.dart';
import 'package:daftfits/features/hydration/providers/hydration_providers.dart'; // Reusing isarProvider

// Provider for food items list
final foodListProvider = FutureProvider<List<FoodItem>>((ref) async {
  final isar = await ref.watch(isarProvider.future);

  // Ensure strict seeding only happens once
  final count = await isar.foodItems.count();
  if (count == 0) {
    final seeder = NutritionSeeder(isar);
    await seeder.seedInitialData();
  }

  return isar.foodItems.where().findAll();
});

// Search food provider parameters
class FoodSearchQuery {
  final String query;
  final String? category;

  FoodSearchQuery({required this.query, this.category});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodSearchQuery &&
          runtimeType == other.runtimeType &&
          query == other.query &&
          category == other.category;

  @override
  int get hashCode => query.hashCode ^ category.hashCode;
}

// Search provider
final foodSearchProvider =
    FutureProvider.family<List<FoodItem>, FoodSearchQuery>((ref, search) async {
  final isar = await ref.watch(isarProvider.future);

  // Apply category filter if present
  if (search.category != null &&
      search.category!.isNotEmpty &&
      search.category != 'all') {
    if (search.query.isNotEmpty) {
      return isar.foodItems
          .filter()
          .categoryEqualTo(search.category!)
          .and()
          .nameContains(search.query, caseSensitive: false)
          .findAll();
    } else {
      return isar.foodItems
          .filter()
          .categoryEqualTo(search.category!)
          .findAll();
    }
  }

  // Apply only name filter if no category
  if (search.query.isNotEmpty) {
    return isar.foodItems
        .filter()
        .nameContains(search.query, caseSensitive: false)
        .findAll();
  }

  // No filters
  return isar.foodItems.where().findAll();
});
