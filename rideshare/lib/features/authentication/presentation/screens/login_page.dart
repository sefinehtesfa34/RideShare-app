import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/authentication/presentation/screens/otp.dart';
import 'package:rideshare/features/authentication/presentation/widgets/redirecting.dart';

import '../../../../core/utils/style.dart';
import '../bloc/login/bloc/login_bloc.dart';
import '../bloc/login/bloc/login_state.dart';
import '../widgets/login_card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginLoginSuccessState) {
          Navigator.push(
              context,
              MaterialPageRoute<OtpVerificationScreen>(
                builder: (BuildContext context) =>
                    const OtpVerificationScreen(),
              ));
        }
      },
      builder: (BuildContext context, LoginState state) {
        if (state is LoginLoadingState) {
          return const Redirecting();
        }

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
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 5.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          child: Text(
                            "Enter Phone Number",
                            style: myTextStyle.copyWith(fontSize: 18.sp),
                          ),
                        ),
                      ),
                    ),
                    const LoginCard()
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
