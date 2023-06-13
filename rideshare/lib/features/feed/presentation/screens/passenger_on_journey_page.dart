import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widget/back_button_custom_icon.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/passenger_on_journey_map.dart';

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
        OnJourneyMap(),
        Positioned(child:  BackButtonCustomIcon(), top: 6.h, left: 6.w),
        Positioned(bottom: 0, child: CustomBottomSheet())
      ]),
    );
  }
}
