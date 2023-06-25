import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/authentication/presentation/screens/otp.dart';
import 'package:rideshare/features/authentication/presentation/widgets/redirecting.dart';

import '../../../../core/utils/colors.dart';
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
          context.go('/verify');
        }
      },
      builder: (BuildContext context, LoginState state) {
        if (state is LoginLoadingState) {
          return const Redirecting();
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.h),
                Center(
                    child:
                        SvgPicture.asset("assets/images/Carpool-rafiki.svg")),
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
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 25.sp))
                    ])),
                  ),
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Share the ride, share the cost",
                    style: myTextStyle.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      child: Text(
                        "Enter Phone Number",
                        style: myTextStyle.copyWith(fontSize: 18.sp,fontWeight: FontWeight.w600),
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
