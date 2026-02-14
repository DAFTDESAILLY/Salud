import 'package:flutter/material.dart';
import 'package:daftfits/core/theme/app_colors.dart';

class MacroRingChart extends StatelessWidget {
  final double currentCalories;
  final int goalCalories;
  final double currentProtein;
  final int goalProtein;
  final double currentCarbs;
  final int goalCarbs;
  final double currentFats;
  final int goalFats;

  const MacroRingChart({
    super.key,
    required this.currentCalories,
    required this.goalCalories,
    required this.currentProtein,
    required this.goalProtein,
    required this.currentCarbs,
    required this.goalCarbs,
    required this.currentFats,
    required this.goalFats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  // Base circle
                  Center(
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: CircularProgressIndicator(
                        value: 1,
                        strokeWidth: 12,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  // Calories Progress
                  Center(
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: CircularProgressIndicator(
                        value: (currentCalories / goalCalories).clamp(0.0, 1.0),
                        strokeWidth: 12,
                        color: AppColors.nutritionPrimary,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  // Inner content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${currentCalories.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '/ $goalCalories kcal',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMacroStat(
                    'Proteína', currentProtein, goalProtein, Colors.purple),
                _buildMacroStat(
                    'Carbos', currentCarbs, goalCarbs, Colors.orange),
                _buildMacroStat('Grasas', currentFats, goalFats, Colors.amber),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMacroStat(String label, double current, int goal, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${current.toStringAsFixed(0)}g',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '/ ${goal}g',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 60,
          child: LinearProgressIndicator(
            value: (current / goal).clamp(0.0, 1.0),
            color: color,
            backgroundColor: color.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
