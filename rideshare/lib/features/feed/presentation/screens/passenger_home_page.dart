import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widget/menu.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/passenger_current_location_map.dart';
// import '../widget/passenger_current_location_map.dart';

class PassengerHomePage extends StatelessWidget {
  const PassengerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CurrentLocationMap(),
        Positioned(child: Menu(), top: 5.h, left: 3.w),
        CustomBottomSheet(),
      ]),
    );
  }
}
