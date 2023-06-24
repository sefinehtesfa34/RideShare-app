import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import '../widget/passenger_current_location_map.dart';

class PickPassengersPage extends StatelessWidget {
  const PickPassengersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // CurrentLocationMap(),
        Positioned(child: BackButton(), top: 5.h, left: 3.w),
        // CustomBottomSheet(),
      ]),
    );
  }
}

