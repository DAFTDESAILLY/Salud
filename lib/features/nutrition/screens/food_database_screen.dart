import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:daftfits/features/nutrition/providers/food_providers.dart';

class FoodDatabaseScreen extends ConsumerStatefulWidget {
  const FoodDatabaseScreen({super.key});

  @override
  ConsumerState<FoodDatabaseScreen> createState() => _FoodDatabaseScreenState();
}

class _FoodDatabaseScreenState extends ConsumerState<FoodDatabaseScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the search provider with current query
    final searchAsync = ref.watch(foodSearchProvider(
      FoodSearchQuery(query: _searchController.text),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Alimento'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar (ej. Manzana, Pollo...)',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              onChanged: (_) =>
                  setState(() {}), // Trigger rebuild to update provider
            ),
          ),
        ),
      ),
      body: searchAsync.when(
        data: (foods) {
          if (foods.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search_off, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'No se encontraron alimentos para "${_searchController.text}"',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () {
                      // TODO: Navigate to create custom food screen
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Crear nuevo alimento'),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            itemCount: foods.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final food = foods[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getCategoryColor(food.category),
                  child: Text(
                    _getCategoryEmoji(food.category),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                title: Text(food.name),
                subtitle: Text(
                  '${food.caloriesPer100g.round()} kcal / 100g\n'
                  'P: ${food.proteinPer100g}g  C: ${food.carbsPer100g}g  F: ${food.fatsPer100g}g',
                ),
                trailing:
                    const Icon(Icons.add_circle_outline, color: Colors.blue),
                isThreeLine: true,
                onTap: () {
                  Navigator.pop(context, food);
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'fruits':
        return Colors.red.shade100;
      case 'vegetables':
        return Colors.green.shade100;
      case 'protein':
        return Colors.orange.shade100;
      case 'grains':
        return Colors.yellow.shade100;
      case 'fats':
        return Colors.yellow.shade200;
      default:
        return Colors.grey.shade100;
    }
  }

  String _getCategoryEmoji(String category) {
    switch (category) {
      case 'fruits':
        return '🍎';
      case 'vegetables':
        return '🥦';
      case 'protein':
        return '🍗';
      case 'grains':
        return '🍚';
      case 'fats':
        return '🥑';
      default:
        return '🍽️';
    }
  }
}
