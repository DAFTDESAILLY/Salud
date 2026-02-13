import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:agua/core/database/isar_service.dart';
import 'package:agua/core/auth/providers/auth_providers.dart';
import 'package:agua/core/auth/screens/onboarding_screen.dart';
import 'package:agua/features/dashboard/screens/home_dashboard.dart';
import 'package:agua/core/theme/app_theme.dart';
// Note: NotificationService and hydration providers might need update later,
// keeping them if they resolve, otherwise might comment out until migrated.
// Actually notification service is in hydration/services/ usually?
// The file view showed: import 'package:agua/features/notifications/services/notification_service.dart';
// If that file wasn't moved, it's fine.
import 'package:agua/features/notifications/services/notification_service.dart';
// import 'package:agua/features/hydration/providers/hydration_providers.dart'; // Likely conflicting or needs move.
// We will comment out hydration specific imports until Phase 2 or if we need them for logic.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Isar
  final isarService = IsarService();
  await isarService.openDB();

  // Initialize Notifications
  final notificationService = NotificationService();
  await notificationService.init();

  runApp(ProviderScope(
    overrides: [
      isarServiceProvider.overrideWithValue(isarService),
      notificationServiceProvider.overrideWithValue(notificationService),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

    return MaterialApp(
      title: 'SuperApp Salud',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es'),
      ],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: profileAsync.when(
        data: (profile) {
          if (profile != null && profile.hasCompletedOnboarding) {
            return const HomeDashboard();
          } else {
            return const OnboardingScreen();
          }
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (err, stack) =>
            Scaffold(body: Center(child: Text('Error initializing: $err'))),
      ),
    );
  }
}
