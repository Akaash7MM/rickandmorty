import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/oboarding_screen_assets.dart';

class OnboardingContainer extends StatelessWidget {
  const OnboardingContainer({super.key, required this.screenNumber});

  final int screenNumber;

  @override
  Widget build(BuildContext context) {
    final onboardingItem = onboardingAssets[screenNumber];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(onboardingItem.getImageSource),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(onboardingItem.headingText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 32)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
              child: Text(onboardingItem.bodyText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 18)),
            )
          ]),
    );
  }
}
