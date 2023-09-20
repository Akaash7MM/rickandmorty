import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/onboarding_container.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final totalScreenCount = 3;
  var screenNumber = 1;

  void _incrementScreenNumber() {
    setState(() {
      screenNumber++;
    });
  }

  void _navigateToAuthScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardingContainer(
            screenNumber: screenNumber,
          ),
          TextButton(
              onPressed: _navigateToAuthScreen,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Text(
                  "Skip",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => screenNumber < totalScreenCount
            ? _incrementScreenNumber()
            : _navigateToAuthScreen(),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Icon(CupertinoIcons.arrow_right),
            CircularProgressIndicator(
              value: screenNumber / totalScreenCount,
            )
          ],
        ),
      ),
    );
  }
}
