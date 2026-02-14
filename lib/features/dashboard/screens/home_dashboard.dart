import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daftfits/core/navigation/bottom_nav_bar.dart';
import 'package:daftfits/features/hydration/screens/dashboard_screen.dart';
import 'package:daftfits/features/hydration/screens/settings_screen.dart';
import 'package:daftfits/features/nutrition/screens/nutrition_home.dart';

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
      const NutritionHome(),
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
