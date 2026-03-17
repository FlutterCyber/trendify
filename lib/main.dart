import 'package:flutter/material.dart';
import 'package:trendify/features/bottom_nav_bar.dart';
import 'core/theme/app_colors.dart';
import 'features/onboarding/screens/splash_screen.dart';

void main() {
  runApp(const TrendifyApp());
}

class TrendifyApp extends StatelessWidget {
  const TrendifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trendify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      home: BottomNavBar(),
    );
  }
}
