import 'package:flutter/material.dart';

import 'onboarding_page_one.dart';
import 'onboarding_page_three.dart';
import 'onboarding_page_two.dart';

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
        children: [OnBoardingPage(context), OnboardingPageTwo(context), OnboardingPageThree(context)],
      ),
    );
  }
}
