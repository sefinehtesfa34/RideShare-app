import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/authentication/presentation/screens/login_page.dart';
import 'package:rideshare/features/authentication/presentation/widgets/select_button.dart';

class OnboardingPageThree extends StatefulWidget {
  const OnboardingPageThree({Key? key}) : super(key: key);

  @override
  State<OnboardingPageThree> createState() => _OnboardingPageThreeState();
}

class _OnboardingPageThreeState extends State<OnboardingPageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'images/Vectorgetstarted.svg',
                height: 20.h,
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.sp),
                    child: Row(
                      children: [
                        Text(
                          'Get',
                          style: TextStyle(
                            color: const Color(0xFF000000),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 25.sp,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text('Started',
                            style: TextStyle(
                              color: const Color(0xFF6D61F2),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 25.sp,
                            )),
                      ],
                    ),
                  ),
                  Text(
                    'Login with your phone to get started',
                    style: TextStyle(
                      color: const Color(0xFF000000),
                      fontFamily: 'Poppins',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ],
          ),
          SvgPicture.asset('images/cuate.svg'),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: 25.w,
                        maxHeight: 25.h // Adjust the width as desired
                        ),
                    child: Image.asset(
                      'assets/images/right_bottom.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.sp, bottom: 20.sp),
                  child: SelectButton(
                    leftPadding: 30.sp,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<LoginPage>(
                              builder: (BuildContext context) =>
                                  const LoginPage()));
                    },
                    buttonName: 'Get Started',
                    radius: 16.sp,
                    rightPadding: 30.sp,
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
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
}
