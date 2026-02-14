import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:daftfits/features/hydration/providers/hydration_providers.dart';
import 'package:daftfits/features/hydration/models/daily_history_data.dart';
import 'package:daftfits/features/hydration/widgets/weekly_bar_chart.dart';
import 'package:daftfits/features/hydration/widgets/summary_metrics.dart';
import 'package:daftfits/features/hydration/models/hydration_log.dart';
import 'package:isar/isar.dart';

import 'package:daftfits/features/hydration/widgets/beverage_stats_view.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  Future<void> _deleteDayLogs(DateTime date) async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar registros'),
        content: Text(
          '¿Estás seguro de que deseas eliminar todos los registros del ${DateFormat('d MMM yyyy', 'es').format(date)}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final isar = await ref.read(isarProvider.future);

      // Get all logs for this day using WHERE clause with timestamp index
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      // Find all logs to delete
      final logsToDelete = await isar.hydrationLogs
          .where()
          .timestampBetween(startOfDay, endOfDay)
          .findAll();

      if (logsToDelete.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No hay registros para eliminar en este día'),
            ),
          );
        }
        return;
      }

      // Extract IDs and delete all logs for this day
      final logIds = logsToDelete.map((log) => log.id).toList();
      await isar.writeTxn(() async {
        await isar.hydrationLogs.deleteAll(logIds);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Se eliminaron ${logsToDelete.length} registro(s) del ${DateFormat('d MMM', 'es').format(date)}',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al eliminar registros: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final historyAsync = ref.watch(weeklyHistoryProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Historial'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'General'),
              Tab(text: 'Por Bebida'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            historyAsync.when(
              data: (history) {
                if (history.isEmpty) {
                  return const Center(child: Text('No hay datos disponibles.'));
                }
                final chronologicalHistory = history.reversed.toList();

                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          WeeklyBarChart(history: chronologicalHistory),
                          const SizedBox(height: 16),
                          SummaryMetrics(history: history),
                          const SizedBox(height: 24),
                          Text(
                            'Detalle',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                        ]),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final dayData = history[index];
                            final isToday = DateUtils.isSameDay(
                                dayData.date, DateTime.now());

                            return Card(
                              elevation: 0,
                              color: isToday
                                  ? colorScheme.primaryContainer
                                      .withOpacity(0.3)
                                  : colorScheme.surfaceContainerHighest
                                      .withOpacity(0.3),
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color:
                                            dayData.intakeMl >= dayData.goalMl
                                                ? Colors.green
                                                : Colors.grey,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat('EEEE d, MMM', 'es')
                                                .format(dayData.date),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${dayData.intakeMl} / ${dayData.goalMl} ml',
                                            style: TextStyle(
                                                color: colorScheme
                                                    .onSurfaceVariant),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (dayData.intakeMl >= dayData.goalMl)
                                      const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.check_circle,
                                            color: Colors.green),
                                      ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline),
                                      color: Colors.red.withOpacity(0.7),
                                      tooltip: 'Eliminar registros del día',
                                      onPressed: () =>
                                          _deleteDayLogs(dayData.date),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: history.length,
                        ),
                      ),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
            const BeverageStatsView(),
          ],
        ),
      ),
    );
  }
}
