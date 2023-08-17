import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';

/// This widget represents a custom back button icon that can be used in UIs.
class BackButtonCustomIcon extends StatelessWidget {
  /// Creates a [BackButtonCustomIcon].
  ///
  /// The [onTap] parameter is optional and is called when the back button is tapped.
  const BackButtonCustomIcon({this.onTap, super.key});
  /// Callback function to be called when the back button is tapped.
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 5.h,
          width: 12.w,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(4)),
          child: Icon(Icons.arrow_back, color: white)),
    );
  }
}
