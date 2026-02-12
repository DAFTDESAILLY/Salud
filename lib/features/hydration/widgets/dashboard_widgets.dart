import 'package:flutter/material.dart';

class StreakDisplay extends StatelessWidget {
  final int days;

  const StreakDisplay({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    if (days < 1) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.local_fire_department,
              color: Colors.orange, size: 20),
          const SizedBox(width: 4),
          Text(
            '$days días racha',
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MotivationText extends StatelessWidget {
  final double percentage;

  const MotivationText({super.key, required this.percentage});

  String get _message {
    if (percentage >= 1.0) return '¡Meta cumplida! 💪';
    if (percentage >= 0.8) return '¡Ya casi lo logras! 🚀';
    if (percentage >= 0.4) return 'Vas muy bien 💧';
    return 'Aún puedes mejorar 💙';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _message,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).textTheme.bodyMedium?.color,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }
}
