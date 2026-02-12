import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';
import 'package:agua/features/hydration/services/hydration_calculator_service.dart';
import 'package:agua/features/hydration/models/hydration_log.dart';
import 'package:agua/features/hydration/screens/history_screen.dart';
import 'package:agua/features/hydration/screens/settings_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  Future<void> _addWater(WidgetRef ref, int amount) async {
    final isar = await ref.read(isarProvider.future);
    final log = HydrationLog()
      ..amountMl = amount
      ..timestamp = DateTime.now();

    await isar.writeTxn(() async {
      await isar.hydrationLogs.put(log);
    });

    // Update notifications
    final profile = await ref.read(userProfileProvider.future);
    if (profile != null) {
      final calculator = HydrationCalculatorService();
      final goal = calculator.calculateDailyGoal(profile);

      // We need the *new* total.
      // Since providers might not update instantly in this async context before we read,
      // we can just read the current total and add the new amount?
      // Or safer: invalidate provider and wait?
      // Simplest: read current total + amount.
      final currentTotal = ref.read(todayTotalIntakeProvider);
      // Note: todayTotalIntakeProvider might not have updated yet because it watches streams.
      // So let's approximate or wait.
      // Actually, better to just pass (currentTotal + amount).

      final scheduler = ref.read(hydrationSchedulerProvider);
      await scheduler.scheduleDailyReminders(
          profile, goal, (currentTotal + amount).toInt());
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalMl = ref.watch(todayTotalIntakeProvider);
    final goalAsync = ref.watch(dailyGoalProvider);
    final progress = ref.watch(hydrationProgressProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Agua',
          style: TextStyle(
            color: colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
            icon: Icon(Icons.history, color: colorScheme.onPrimaryContainer),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            icon: Icon(Icons.settings, color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD), // Light Blue 50
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),

              // Goal Text
              goalAsync.when(
                data: (goal) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flag_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 20),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'Meta: $goal ml',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),

              const SizedBox(height: 40),

              // Hero Water Indicator
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Water Wave Circle
                      AnimatedBuilder(
                        animation: _waveController,
                        builder: (context, child) {
                          return CustomPaint(
                            size: const Size(280, 280),
                            painter: WaterWavePainter(
                              percentage: progress,
                              animationValue: _waveController.value,
                              color: const Color(0xFF6FA6E0),
                            ),
                          );
                        },
                      ),
                      // Glassy Overlay Ring
                      Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6FA6E0).withOpacity(0.2),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                      // Text Info
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3436),
                            ),
                          ),
                          Text(
                            '${totalMl.toInt()} ml',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Quick Add Section
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Registrar consumo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3436),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _QuickAddButton(
                          amount: 250,
                          label: '250ml',
                          icon: Icons.local_drink_rounded,
                          color: const Color(0xFF81D4FA),
                          onTap: () => _addWater(ref, 250),
                        ),
                        const SizedBox(width: 12),
                        _QuickAddButton(
                          amount: 500,
                          label: '500ml',
                          icon: Icons.water_drop_rounded,
                          color: const Color(0xFF4FC3F7),
                          onTap: () => _addWater(ref, 500),
                        ),
                        const SizedBox(width: 12),
                        _QuickAddButton(
                          amount: 1000,
                          label: '1L',
                          icon: Icons.water_rounded,
                          color: const Color(0xFF29B6F6),
                          onTap: () => _addWater(ref, 1000),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAddButton extends StatelessWidget {
  final int amount;
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickAddButton({
    required this.amount,
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: color.withOpacity(0.3),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: color.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WaterWavePainter extends CustomPainter {
  final double percentage;
  final double animationValue;
  final Color color;

  WaterWavePainter({
    required this.percentage,
    required this.animationValue,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    // Clip circle
    final circlePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
    canvas.clipPath(circlePath);

    // Draw background circle
    canvas.drawCircle(center, radius, Paint()..color = color.withOpacity(0.05));

    // Calculate wave height based on percentage
    final waveHeight = size.height * (1 - percentage.clamp(0.0, 1.0));

    // Draw waves
    final path = Path();
    path.moveTo(0, waveHeight);

    for (double i = 0; i <= size.width; i++) {
      path.lineTo(
        i,
        waveHeight +
            sin((i / size.width * 2 * pi) + (animationValue * 2 * pi)) * 10,
      );
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw second wave slightly offset
    final paint2 = Paint()
      ..color = color.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    final path2 = Path();
    path2.moveTo(0, waveHeight);

    for (double i = 0; i <= size.width; i++) {
      path2.lineTo(
        i,
        waveHeight +
            cos((i / size.width * 2 * pi) + (animationValue * 2 * pi)) * 8,
      );
    }

    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant WaterWavePainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.animationValue != animationValue;
  }
}
