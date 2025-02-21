import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sterownik_akwarium/app/core/color_schemes.g.dart';

import 'app/core/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'sterownik_akwarium',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // Initialize Firestore with settings
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true, // Enable offline persistence
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED, // Optional: Set cache size
  );

  // // Optional: Enable Firestore logging in debug mode
  // if (kDebugMode) {
  //   FirebaseFirestore.instance.setLoggingEnabled(true);
  // }

  //await FirebaseApi().initNotifications();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Sterownik Akwarium',
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      routerConfig: routes,
    );
  }
}
