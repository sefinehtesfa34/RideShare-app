import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/bottom_button.dart';
import '../widgets/journey_started_custom_sheet.dart';

class JourneyStartedPage extends StatelessWidget {
  const JourneyStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
          children: [
            // GoogleMapViewer(latitude: 9.005401, longitude: 38.763611),
            CustomBottomSheet(),
          ],
        ),
        bottomNavigationBar: BottomButton());
  }
}
