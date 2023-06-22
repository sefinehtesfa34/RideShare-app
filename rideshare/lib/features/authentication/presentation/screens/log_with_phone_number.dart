import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/style.dart';
import '../widgets/accept_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: ListView(
          children: <Widget>[
            Center(child: SvgPicture.asset("images/Carpool-rafiki.svg")),
            Padding(
              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
              child: Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Ride",
                      style: myTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "Share",
                      style: myTextStyle.copyWith(
                        color: Color(0xFF6D61F2),
                        fontWeight: FontWeight.w600,
                        fontSize: 25.sp,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Center(
              child: Text(
                "A platform to make your life easier",
                style: myTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Center(
              child: Text(
                "lorem platform to make your life easier",
                style: myTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 5.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter Phone Number",
                      style: myTextStyle.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.only(left: 20.w, top: 2.h, right: 20.w),
                //   child: const PhoneNumberField(
                //       code: '+251', phoneNumber: '920786545'),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 2.h),
                      AcceptText(
                          controller: TextEditingController(),
                          label: 'Age',
                          hintText: "Insert age"),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                ElevatedButton(
                  onPressed: () {
                    // Add onPressed logic here
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
