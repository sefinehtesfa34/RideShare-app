import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/back_button.dart';
import '../widgets/horizontal_line.dart';
import '../widgets/search_text_field.dart';
import '../widgets/select_button.dart';
import 'location_marker.dart';

class LocationPickerPage extends StatelessWidget {
  const LocationPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 100.h,
            child: const CustomizeMarker(),
          ),
          Positioned(
            bottom: 0.h,
            left: 0,
            right: 0,
            height: 40.h,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.sp),
                      topRight: Radius.circular(22.sp),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.sp, right: 19.sp),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 6.h),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                                'images/current_mocation_marker.svg'),
                            SizedBox(width: 1.w),
                            const Expanded(
                              child: SearchTextField(
                                hintText: 'Enter source location',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.0.h),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset('images/Subtract.svg'),
                            SizedBox(width: 1.w),
                            const Expanded(
                              child: SearchTextField(
                                hintText: 'Enter destination location',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.0.h),
                        const SelectButton()
                      ],
                    ),
                  ),
                ),
                const HorizontalLine()
              ],
            ),
          ),
          const Back(),
        ],
      ),
    );
  }
}
