import 'package:flutter/material.dart';

class SizeSelectionSheet extends StatefulWidget {
  final String beverageType;
  final Function(int amount) onConfirmed;

  const SizeSelectionSheet({
    super.key,
    required this.beverageType,
    required this.onConfirmed,
  });

  @override
  State<SizeSelectionSheet> createState() => _SizeSelectionSheetState();
}

class _SizeSelectionSheetState extends State<SizeSelectionSheet> {
  final _customController = TextEditingController();
  bool _isCustom = false;

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  void _confirm(int amount) {
    widget.onConfirmed(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context), // Go back to beverages
              ),
              Expanded(
                child: Text(
                  'Elige el tamaño',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 48), // Balance back button
            ],
          ),
          const SizedBox(height: 24),
          if (!_isCustom) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SizeOption(
                  amount: 250,
                  label: 'Pequeño',
                  icon: Icons.local_cafe_outlined, // Cup
                  onTap: () => _confirm(250),
                ),
                _SizeOption(
                  amount: 350,
                  label: 'Mediano',
                  icon: Icons.local_drink_outlined, // Glass
                  onTap: () => _confirm(350),
                ),
                _SizeOption(
                  amount: 500,
                  label: 'Grande',
                  icon: Icons.local_bar_outlined, // Pint/Bottle
                  onTap: () => _confirm(500),
                ),
              ],
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () => setState(() => _isCustom = true),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Otro tamaño'),
            ),
          ] else ...[
            TextField(
              controller: _customController,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Cantidad (ml)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixText: 'ml',
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                final amount = int.tryParse(_customController.text);
                if (amount != null && amount > 0) {
                  _confirm(amount);
                }
              },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Confirmar'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => setState(() => _isCustom = false),
              child: const Text('Cancelar'),
            ),
          ],
        ],
      ),
    );
  }
}

class _SizeOption extends StatelessWidget {
  final int amount;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _SizeOption({
    required this.amount,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.3),
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '$amount ml',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}
