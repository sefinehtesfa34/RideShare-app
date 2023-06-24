import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/style.dart';
import '../widgets/slider.dart';

OnBoardingPage(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.w),
          child: Stack(children: [
            SvgPicture.asset(
              "assets/images/animation_1.svg",
              // height: 20.h,
              width: 24.w,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 6.w, bottom: 5.h),
              child: SvgPicture.asset("assets/images/carpool_caute.svg"),
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
                    color: const Color(0xFF6D61F2),
                    fontWeight: FontWeight.w600,
                    fontSize: 25.sp))
          ])),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 2.h, bottom: 5.h, left: 6.w, right: 6.w),
          child: SizedBox(
            // width: 80.w,
            // child: Center(
            child: Text(
                "Share the ride, share the cost. Affordable shared trips connecting people in need.",
                style: myTextStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300
                ),
                textAlign: TextAlign.center),
          ),
        ),
        // SizedBox(height: 10.h),
        SizedBox(height: 10.h),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                  bottom: 5.5.h
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <SliderPage>[
                    SliderPage(color: const Color(0xFF264FAD), width: 6.w),
                    SliderPage(color: const Color(0xFFB9B9B9), width: 2.w),
                    SliderPage(color: const Color(0xFFB9B9B9), width: 2.w)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 3.w,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () => {context.go('/login')},
                  child: Image.asset(
                    'assets/images/safe_skip.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
