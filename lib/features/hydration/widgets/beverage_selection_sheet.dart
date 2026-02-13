import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/features/hydration/providers/beverage_providers.dart';

class BeverageSelectionSheet extends ConsumerWidget {
  final Function(String type, double coefficient, List<int>? presetSizes)
      onSelected;

  const BeverageSelectionSheet({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beveragesAsync = ref.watch(activeBeveragesProvider);

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
          beveragesAsync.when(
            data: (beverages) => GridView.builder(
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
                  name: beverage.name,
                  icon: beverage.iconCodePoint != null
                      ? IconData(beverage.iconCodePoint!,
                          fontFamily: 'MaterialIcons')
                      : _getIconForType(beverage.type),
                  coeff: beverage.coefficient,
                  colorValue: beverage.colorValue,
                  onTap: () => onSelected(
                    beverage.type,
                    beverage.coefficient,
                    beverage.presetSizes,
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'water':
        return Icons.water_drop;
      case 'coffee':
        return Icons.coffee;
      case 'tea':
        return Icons.emoji_food_beverage;
      case 'juice':
        return Icons.local_drink;
      case 'soda':
        return Icons.fastfood;
      case 'smoothie':
        return Icons.blender;
      default:
        return Icons.local_cafe;
    }
  }
}

class _BeverageCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final double coeff;
  final int colorValue;
  final VoidCallback onTap;

  const _BeverageCard({
    required this.name,
    required this.icon,
    required this.coeff,
    required this.colorValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(colorValue);
    return Material(
      color: color.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              '${(coeff * 100).toInt()}%',
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
