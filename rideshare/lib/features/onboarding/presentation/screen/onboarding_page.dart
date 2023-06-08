import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage("assets/images/carpool_cuate.png"),
            width: 100.w,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ride",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Text(
                    "Share",
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
              Text(
                "A platform to make your life easier lorem A platform to make your life easier",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Poppins", fontSize: 4.w),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(2.5.h)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Get Started",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
