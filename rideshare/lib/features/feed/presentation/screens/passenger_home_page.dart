import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../bloc/passenger_home_bloc.dart';
import '../widget/destination_list.dart';
import '../widget/menu.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/passenger_current_location_map.dart';

class PassengerHomePage extends StatelessWidget {
  const PassengerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CurrentLocationMap(),
        Positioned(child: Menu(), top: 6.h, left: 6.w),
        Positioned(bottom: 0, child: CustomBottomSheet()),
        
      ]),
    );
  }
}
