import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/oboarding_screen_assets.dart';
import '../widgets/onboarding_container.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final totalScreenCount = 3;
  var screenNumber = 1.0;

  final pageViewController = PageController(initialPage: 0);

  void _navigateToNextPage() {
    setState(() {
      pageViewController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
    //pageview starts at -1, screenNumber starts from 1
    screenNumber = pageViewController.page! + 2;
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Image.asset(logoSource),
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (ctx, index) =>
                  OnboardingContainer(screenNumber: index),
              itemCount: 3,
              controller: pageViewController,
              physics: const NeverScrollableScrollPhysics(),
            ),
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
            ? _navigateToNextPage()
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
