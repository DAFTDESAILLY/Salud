import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:agua/core/database/isar_service.dart';
import 'package:agua/features/hydration/models/beverage_config.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';

final beverageConfigProvider =
    FutureProvider<List<BeverageConfig>>((ref) async {
  final isar = await ref.watch(isarProvider.future);

  // Seed if empty
  final count = await isar.beverageConfigs.count();
  if (count == 0) {
    await isar.writeTxn(() async {
      final defaults = [
        BeverageConfig()
          ..type = 'water'
          ..name = 'Agua'
          ..coefficient = 1.0
          ..isEnabled = true
          ..colorValue = Colors.blue.value
          ..updatedAt = DateTime.now(),
        BeverageConfig()
          ..type = 'coffee'
          ..name = 'Café'
          ..coefficient = 0.8
          ..isEnabled = true
          ..colorValue = Colors.brown.value
          ..updatedAt = DateTime.now(),
        BeverageConfig()
          ..type = 'tea'
          ..name = 'Té'
          ..coefficient = 0.9
          ..isEnabled = true
          ..colorValue = Colors.green.value
          ..updatedAt = DateTime.now(),
        BeverageConfig()
          ..type = 'juice'
          ..name = 'Jugo'
          ..coefficient = 0.95
          ..isEnabled = true
          ..colorValue = Colors.orange.value
          ..updatedAt = DateTime.now(),
        BeverageConfig()
          ..type = 'soda'
          ..name = 'Refresco'
          ..coefficient = 0.85
          ..isEnabled = true
          ..colorValue = Colors.purple.value
          ..updatedAt = DateTime.now(),
        BeverageConfig()
          ..type = 'smoothie'
          ..name = 'Batido'
          ..coefficient = 0.7
          ..isEnabled = true
          ..colorValue = Colors.pink.value
          ..updatedAt = DateTime.now(),
      ];
      await isar.beverageConfigs.putAll(defaults);
    });
  }

  // Return all configs
  return await isar.beverageConfigs.where().findAll();
});

final activeBeveragesProvider =
    Provider<AsyncValue<List<BeverageConfig>>>((ref) {
  final configsAsync = ref.watch(beverageConfigProvider);
  return configsAsync
      .whenData((configs) => configs.where((c) => c.isEnabled).toList());
});
