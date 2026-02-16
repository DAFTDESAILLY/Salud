import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:daftfits/core/database/isar_service.dart';
import 'package:daftfits/core/auth/providers/auth_providers.dart';
import 'package:daftfits/core/auth/screens/onboarding_screen.dart';
import 'package:daftfits/features/dashboard/screens/home_dashboard.dart';
import 'package:daftfits/core/theme/app_theme.dart';
import 'package:daftfits/features/notifications/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Isar
  final isarService = IsarService();
  await isarService.openDB();

  // Initialize Notifications
  final notificationService = NotificationService();
  await notificationService.init();

  // Request notification permissions
  print('🔔 Requesting notification permissions...');
  await notificationService.requestPermissions();

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
