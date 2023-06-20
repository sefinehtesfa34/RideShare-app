import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widget/menu.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/passenger_current_location_map.dart';

class PassengerOnJourneyPage extends StatefulWidget {
  const PassengerOnJourneyPage({super.key});

  @override
  State<PassengerOnJourneyPage> createState() => _PassengerOnJourneyPageState();
}

class _PassengerOnJourneyPageState extends State<PassengerOnJourneyPage> {
  // static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  // static const LatLng destination = LatLng(37.33500937, -122.03272139);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CurrentLocationMap(),
        Positioned(child: Menu(), top: 6.h, left: 6.w),
        Positioned(bottom: 0, child: CustomBottomSheet())
      ]),
    );
  }
}
