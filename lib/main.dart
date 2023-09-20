import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OnboardingScreen(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
