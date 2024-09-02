import 'package:flutter/material.dart';
import 'package:spotify/core/config/theme/app_tehem.dart';
import 'package:spotify/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTehem.lightTheme,
      home: const SplashPage(),
    );
  }
}
