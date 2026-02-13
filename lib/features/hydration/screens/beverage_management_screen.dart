import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/features/hydration/models/beverage_config.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';
import 'package:agua/features/hydration/providers/beverage_providers.dart';
import 'package:agua/features/hydration/screens/add_beverage_screen.dart';

class BeverageManagementScreen extends ConsumerWidget {
  const BeverageManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configsAsync = ref.watch(beverageConfigProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestionar Bebidas'),
      ),
      body: configsAsync.when(
        data: (configs) {
          // Sort enabled first, then by type/name
          final sortedConfigs = List<BeverageConfig>.from(configs)
            ..sort((a, b) {
              if (a.isEnabled != b.isEnabled) {
                return a.isEnabled ? -1 : 1;
              }
              return a.name.compareTo(b.name);
            });

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(
                16, 16, 16, 120), // Extra bottom padding for FAB
            itemCount: sortedConfigs.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _BeverageConfigCard(
                key: ValueKey(sortedConfigs[index].type),
                config: sortedConfigs[index],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBeverageScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _BeverageConfigCard extends ConsumerStatefulWidget {
  final BeverageConfig config;

  const _BeverageConfigCard({super.key, required this.config});

  @override
  ConsumerState<_BeverageConfigCard> createState() =>
      _BeverageConfigCardState();
}

class _BeverageConfigCardState extends ConsumerState<_BeverageConfigCard> {
  late double _currentCoeff;
  late bool _isEnabled;

  @override
  void initState() {
    super.initState();
    _currentCoeff = widget.config.coefficient;
    _isEnabled = widget.config.isEnabled;
  }

  @override
  void didUpdateWidget(_BeverageConfigCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config.id != oldWidget.config.id ||
        widget.config.coefficient != oldWidget.config.coefficient ||
        widget.config.isEnabled != oldWidget.config.isEnabled) {
      _currentCoeff = widget.config.coefficient;
      _isEnabled = widget.config.isEnabled;
    }
  }

  Future<void> _saveChanges() async {
    final isar = await ref.read(isarProvider.future);
    await isar.writeTxn(() async {
      widget.config.coefficient = _currentCoeff;
      widget.config.isEnabled = _isEnabled;
      widget.config.updatedAt = DateTime.now();
      await isar.beverageConfigs.put(widget.config);
    });
    // Trigger refresh
    ref.refresh(beverageConfigProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(widget.config.colorValue).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getIconForType(widget.config.type),
                    color: Color(widget.config.colorValue),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.config.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        'Hidratación: ${(_currentCoeff * 100).toInt()}%',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: _isEnabled,
                  onChanged: (val) {
                    setState(() => _isEnabled = val);
                    _saveChanges();
                  },
                ),
              ],
            ),
            if (_isEnabled) ...[
              const Divider(height: 24),
              Row(
                children: [
                  const Text('50%'),
                  Expanded(
                    child: Slider(
                      value: _currentCoeff,
                      min: 0.5,
                      max: 1.2,
                      divisions: 14, // 0.05 steps roughly
                      label: '${(_currentCoeff * 100).toInt()}%',
                      onChanged: (val) {
                        setState(() => _currentCoeff = val);
                      },
                      onChangeEnd: (val) {
                        _saveChanges();
                      },
                    ),
                  ),
                  const Text('120%'),
                ],
              ),
            ],
          ],
        ),
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
