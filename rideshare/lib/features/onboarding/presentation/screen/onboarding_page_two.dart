import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/onboarding/presentation/widgets/slider.dart';

OnboardingPageTwo(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        SizedBox(height: 5.h),
        SvgPicture.asset('assets/images/circle.svg'),
        SizedBox(height: 5.h),
        SvgPicture.asset('assets/images/online_booking.svg'),
        Text(
          'Safe & Efficient',
          style: TextStyle(
            color: const Color(0xFF000000),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 25.sp,
          ),
        ),
        Text(
          'Enjoy secure, Efficient and \n streamlined RideSharing',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF000000),
          ),
        ),
        SizedBox(height: 20.h),
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
  
                    SliderPage(color: const Color(0xFFB9B9B9), width: 2.w),
                    SliderPage(color: const Color(0xFF264FAD), width: 6.w),
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
          ),)
      ],
    ),
  );
}
