import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/bottom_button.dart';
import '../widgets/journey_started_custom_sheet.dart';

class JourneyStartedPage extends StatelessWidget {
  const JourneyStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            CustomBottomSheet(),
          ],
        ),
        bottomNavigationBar: BottomButton());
  }
}
