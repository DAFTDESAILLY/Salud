import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daftfits/core/theme/app_colors.dart';

final navigationIndexProvider = StateProvider<int>((ref) => 0);

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) =>
          ref.read(navigationIndexProvider.notifier).state = index,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.cardDark,
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'Agua'),
        BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), label: 'Fitness'),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Comida'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
      ],
    );
  }
}
