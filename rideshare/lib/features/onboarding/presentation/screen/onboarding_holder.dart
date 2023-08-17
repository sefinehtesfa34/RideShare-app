import 'package:flutter/material.dart';

import 'onboarding_page_one.dart';
import 'onboarding_page_three.dart';
import 'onboarding_page_two.dart';

/// A widget that orchestrates the display of a sequence of onboarding pages.
/// This widget provides a scaffold for navigating through multiple onboarding pages.
class OnBoardingHolder extends StatefulWidget {
  const OnBoardingHolder({super.key});

  @override
  State<OnBoardingHolder> createState() => _OnBoardingHolderState();
}

class _OnBoardingHolderState extends State<OnBoardingHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          // First onboarding page
          OnBoardingPage(context),

          // Second onboarding page
          OnboardingPageTwo(context),

          // Third onboarding page
          OnboardingPageThree(context),
        ],
      ),
    );
  }
}
