import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:daftfits/features/hydration/models/daily_history_data.dart';

class WeeklyBarChart extends StatelessWidget {
  final List<DailyHistoryData> history; // Expects last 7 days

  const WeeklyBarChart({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();

    // Find max intake to normalize bars
    double maxIntake = 0;
    for (var day in history) {
      if (day.intakeMl > maxIntake) maxIntake = day.intakeMl.toDouble();
      if (day.goalMl > maxIntake) maxIntake = day.goalMl.toDouble();
    }
    if (maxIntake == 0) maxIntake = 2000; // Default fallback

    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumen Semanal',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: history.map((data) {
                  return _Bar(
                    data: data,
                    maxIntake: maxIntake,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final DailyHistoryData data;
  final double maxIntake;

  const _Bar({required this.data, required this.maxIntake});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = (data.intakeMl / maxIntake).clamp(0.0, 1.0);
    final isSuccess = data.intakeMl >= data.goalMl;
    final isToday = DateUtils.isSameDay(data.date, DateTime.now());

    // Day label (e.g., "Lun")
    final dayLabel =
        DateFormat.E('es').format(data.date).substring(0, 1).toUpperCase();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Bar
        Container(
          width: 12, // Slender bars
          height: 120 * percentage, // Max height 120
          decoration: BoxDecoration(
            color: isSuccess
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
            boxShadow: isToday && isSuccess
                ? [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 8),
        // Label
        Text(
          dayLabel,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            color: isToday
                ? theme.colorScheme.primary
                : theme.textTheme.bodyMedium?.color,
          ),
        ),
      ],
    );
  }
}
