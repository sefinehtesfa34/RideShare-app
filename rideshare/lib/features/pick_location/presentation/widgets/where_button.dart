import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/pick_location/presentation/widgets/choose_location.dart';

import '../../../../core/utils/colors.dart';

typedef OnTapCallback = void Function();

/// CustomButton Widget
///
/// A reusable button widget with a specified text and onTap callback.
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});

  /// The text to be displayed on the button.
  final String text;

  /// The callback function to be executed when the button is tapped.
  final OnTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      width: 90.w,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      // child:
      child: InkWell(
        onTap: onTap,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Poppins",
            color: white,
          ),
        )),
      ),
    );
  }
}
