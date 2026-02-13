import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';
import 'package:agua/features/hydration/models/daily_history_data.dart';
import 'package:agua/features/hydration/widgets/weekly_bar_chart.dart';
import 'package:agua/features/hydration/widgets/summary_metrics.dart';

import 'package:agua/features/hydration/widgets/beverage_stats_view.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                                  : colorScheme.surfaceVariant.withOpacity(0.3),
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
                                      const Icon(Icons.check_circle,
                                          color: Colors.green),
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
