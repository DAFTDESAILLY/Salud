import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agua/core/navigation/bottom_nav_bar.dart';
import 'package:agua/features/hydration/screens/dashboard_screen.dart';
import 'package:agua/features/hydration/screens/settings_screen.dart';

class HomeDashboard extends ConsumerWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    // Placeholder screens until implemented
    final screens = [
      const Center(child: Text('Home Dashboard (Unified)')),
      const DashboardScreen(),
      const Center(child: Text('Módulo Fitness')),
      const Center(child: Text('Módulo Nutrición')),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
