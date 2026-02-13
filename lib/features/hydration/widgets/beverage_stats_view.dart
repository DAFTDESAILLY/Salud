import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';
import 'package:agua/features/hydration/providers/beverage_providers.dart';
import 'package:agua/features/hydration/models/beverage_config.dart';

class BeverageStatsView extends ConsumerWidget {
  const BeverageStatsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyLogsAsync = ref.watch(weeklyLogsProvider);
    final configsAsync = ref.watch(beverageConfigProvider);

    return weeklyLogsAsync.when(
      data: (logs) {
        if (logs.isEmpty) {
          return const Center(child: Text('No hay registros esta semana.'));
        }

        // Group by type
        final Map<String, double> totalsByType = {};
        double totalVolume = 0;

        for (var log in logs) {
          final type = log.beverageType ?? 'water';
          // Use effective Amount or raw Amount?
          // Requirement: "Total ml reales" and "Total ml efectivos"
          // Let's show "Real Intake" (amountMl) mostly, or maybe effective.
          // Requirements for charts usually imply Volume.
          // Let's stick to AmountMl (Real Volume) for consumption stats,
          // OR Effective for "Hydration Impact".
          // Doc says: "Café — 1200ml (15%)" -> implies Volume.

          final amount = log.amountMl.toDouble();
          totalsByType[type] = (totalsByType[type] ?? 0) + amount;
          totalVolume += amount;
          print(
              'DEBUG: StatsView processing log - Type: $type, Amount: $amount');
        }
        print('DEBUG: StatsView totals: $totalsByType');

        // Sort by volume descending
        final sortedEntries = totalsByType.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

        return configsAsync.when(
          data: (configs) {
            // Map configs for easy lookup
            final configMap = {for (var c in configs) c.type: c};

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: sortedEntries.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final entry = sortedEntries[index];
                final type = entry.key;
                final volume = entry.value;
                final percentage =
                    (volume / totalVolume * 100).toStringAsFixed(1);

                final config = configMap[type] ?? BeverageConfig() // Fallback
                  ..name = type.toUpperCase()
                  ..colorValue = Colors.grey.value;

                return _BeverageStatBar(
                  name: config.name,
                  volume: volume,
                  percentage: percentage,
                  color: Color(config.colorValue),
                  totalVolume: totalVolume,
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const SizedBox(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

class _BeverageStatBar extends StatelessWidget {
  final String name;
  final double volume;
  final String percentage;
  final Color color;
  final double totalVolume;

  const _BeverageStatBar({
    required this.name,
    required this.volume,
    required this.percentage,
    required this.color,
    required this.totalVolume,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              '${volume.toInt()} ml ($percentage%)',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: volume / totalVolume,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation(color),
            minHeight: 12,
          ),
        ),
      ],
    );
  }
}
