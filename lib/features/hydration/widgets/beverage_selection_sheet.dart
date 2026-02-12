import 'package:flutter/material.dart';

class BeverageSelectionSheet extends StatelessWidget {
  final Function(String type, double coefficient) onSelected;

  const BeverageSelectionSheet({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    // Define beverages and coefficients
    final beverages = [
      {'id': 'water', 'name': 'Agua', 'coeff': 1.0, 'icon': Icons.water_drop},
      {'id': 'coffee', 'name': 'Café', 'coeff': 0.8, 'icon': Icons.coffee},
      {
        'id': 'tea',
        'name': 'Té',
        'coeff': 0.9,
        'icon': Icons.emoji_food_beverage
      },
      {'id': 'juice', 'name': 'Jugo', 'coeff': 0.95, 'icon': Icons.local_drink},
      {
        'id': 'soda',
        'name': 'Refresco',
        'coeff': 0.85,
        'icon': Icons.fastfood
      }, // Icon might vary
      {'id': 'smoothie', 'name': 'Batido', 'coeff': 0.7, 'icon': Icons.blender},
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Selecciona una bebida',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: beverages.length,
            itemBuilder: (context, index) {
              final beverage = beverages[index];
              return _BeverageCard(
                name: beverage['name'] as String,
                icon: beverage['icon'] as IconData,
                coeff: beverage['coeff'] as double,
                onTap: () => onSelected(
                  beverage['id'] as String,
                  beverage['coeff'] as double,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _BeverageCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final double coeff;
  final VoidCallback onTap;

  const _BeverageCard({
    required this.name,
    required this.icon,
    required this.coeff,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              '${(coeff * 100).toInt()}% hidratación',
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
