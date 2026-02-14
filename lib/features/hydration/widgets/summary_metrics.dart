import 'package:flutter/material.dart';
import 'package:daftfits/features/hydration/models/daily_history_data.dart';

class SummaryMetrics extends StatelessWidget {
  final List<DailyHistoryData> history;

  const SummaryMetrics({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();

    // Calculate metrics
    double totalIntake = 0;
    int successDays = 0;
    double maxIntake = 0;

    for (var day in history) {
      totalIntake += day.intakeMl;
      if (day.intakeMl >= day.goalMl) successDays++;
      if (day.intakeMl > maxIntake) maxIntake = day.intakeMl.toDouble();
    }

    final average = totalIntake / history.length;
    final compliance = (successDays / history.length * 100).toInt();

    return Row(
      children: [
        _MetricCard(
          label: 'Promedio',
          value: '${average.toInt()} ml',
          icon: Icons.water_drop_outlined,
          color: Colors.blue,
        ),
        const SizedBox(width: 8),
        _MetricCard(
          label: 'Mejor Día',
          value: '${maxIntake.toInt()} ml',
          icon: Icons.emoji_events_outlined,
          color: Colors.amber,
        ),
        const SizedBox(width: 8),
        _MetricCard(
          label: 'Cumplimiento',
          value: '$compliance%',
          icon: Icons.check_circle_outline,
          color: Colors.green,
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
