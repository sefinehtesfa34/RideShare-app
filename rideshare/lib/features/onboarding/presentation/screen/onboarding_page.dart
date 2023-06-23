import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/authentication/presentation/screens/login_page.dart';
import 'package:rideshare/features/onboarding/presentation/widgets/slider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 5.h),
          SvgPicture.asset('images/circle.svg'),
          SizedBox(height: 5.h),
          SvgPicture.asset('images/online_booking.svg'),
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
          SizedBox(height: 10.h),
          Expanded(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Image.asset(
                        'assets/images/vectorbottom.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.sp),
                        child:InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute<LoginPage>(builder: (BuildContext context)=>const LoginPage()))
                          },
                          child: Image.asset(
                            'images/safe_next.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <SliderPage>[
                    SliderPage(color: const Color(0xFFB9B9B9), width: 1.5.w),
                    SliderPage(color: const Color(0xFF264FAD), width: 4.w),
                    SliderPage(color: const Color(0xFFB9B9B9), width: 1.5.w)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
