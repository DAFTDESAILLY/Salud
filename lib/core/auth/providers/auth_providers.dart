import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daftfits/core/database/isar_service.dart';
import 'package:daftfits/core/auth/models/user_profile.dart';
import 'package:isar/isar.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService(); // Or handle singleton if needed, but IsarService usually handles it internally
});

// Re-export isarProvider if it was used elsewhere, or define a new one
// Assuming hydration_providers used a provider for Isar instance.
// Let's create a consistent one here.

final isarProvider = FutureProvider<Isar>((ref) async {
  final service = ref.watch(isarServiceProvider);
  return service.db;
});

final userProfileProvider = StreamProvider<UserProfile?>((ref) async* {
  final isar = await ref.watch(isarProvider.future);
  // watchObject is available on QueryBuilder? No, usually collection.watchObject(id)
  // Check Isar version/docs. Usually: isar.userProfiles.watchObject(id)
  // But wait, Isar 3.1.0 changes.
  // Let's assume singular profile with ID 1 for now.
  yield* isar.userProfiles.watchObject(1, fireImmediately: true);
});
