import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/style.dart';
import '../bloc/auth_bloc.dart';
import '../screen/otp.dart';
import 'country_code.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthBlocLoginSuccess) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => otpPage()));
        }
      },
      builder: (context, state) {
        if (state is AuthBlocLoading) {
          return CircularProgressIndicator();
        }  else {
          return loginField(context, "Submit");
        }
      },
    );
  }

  Widget loginField(context, text) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(left: 20.w, top: 2.h),
        child: Row(
          children: [
            const CountryCode(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 2.w, right: 12.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.w),
                      color: Color(0xFFEFEFFA)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: myTextStyle.copyWith(
                        fontSize: 15.5.sp,
                        color: Color(0xFF8090BA),
                      ),
                      controller: phoneNumberController,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 20.w, right: 11.w, top: 20.sp),
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<AuthBloc>(context)
                .add(LoginEvent(phoneNumber: phoneNumberController.text));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF6E80B0),
                  width: 0.3.w,
                )),
            child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Center(
                    child: Text(
                  text,
                  style: myTextStyle.copyWith(
                      color: Color(0xFF6D61F2), fontSize: 18.sp),
                ))),
          ),
        ),
      )
    ]);

    //
  }
}
