import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:agua/core/database/isar_service.dart';
import 'package:agua/features/notifications/services/notification_service.dart';
import 'package:agua/features/hydration/providers/hydration_providers.dart';
import 'package:agua/features/hydration/screens/onboarding_screen.dart';
import 'package:agua/features/hydration/screens/dashboard_screen.dart';
import 'package:agua/core/theme/app_theme.dart';

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
      title: 'Agua',
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
      themeMode: ThemeMode.dark, // Enforce dark mode as per requirements
      home: profileAsync.when(
        data: (profile) {
          // If profile exists, go to Dashboard. Else, Onboarding.
          return profile != null
              ? const DashboardScreen()
              : const OnboardingScreen();
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (err, stack) =>
            Scaffold(body: Center(child: Text('Error initializing: $err'))),
      ),
    );
  }
}
