import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/style.dart';
import '../widgets/slider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: Stack(children: [
              SvgPicture.asset(
                "images/animation_1.svg",
                // height: 20.h,
                width: 24.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 6.w, bottom: 5.h),
                child: SvgPicture.asset("images/carpool_caute.svg"),
              )
            ]),
          ),
          Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Ride",
                style: myTextStyle.copyWith(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600),
              ),
              TextSpan(
                  text: "Share",
                  style: myTextStyle.copyWith(
                      color: Color(0xFF6D61F2),
                      fontWeight: FontWeight.w600,
                      fontSize: 25.sp))
            ])),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 5.h, left: 10.w),
            child: SizedBox(
              width: 60.w,
              // child: Center(
              child: Text(
                "Share the ride, share the cost. Affordable shared trips connecting people in need.",
                style: myTextStyle.copyWith(fontSize: 17.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("slider"),
                // IntroductionScreen(),
                Stack(
                  children: [SvgPicture.asset("images/"), Text("Skip", style: myTextStyle.copyWith(color: Color(0xFF)),)],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
