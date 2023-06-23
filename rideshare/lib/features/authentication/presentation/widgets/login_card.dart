import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/authentication/presentation/bloc/login/bloc/login_bloc.dart';
import 'package:rideshare/features/authentication/presentation/bloc/login/bloc/login_event.dart';
import '../../../../core/utils/style.dart';
import '../bloc/login/bloc/login_state.dart';
import 'country_code.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final TextEditingController phoneNumberController = TextEditingController();
  bool isFieldEmpty = false;

  @override
  Widget build(BuildContext context) {
    return loginButton(context, "Submit");
  }

  Widget loginButton(BuildContext context, String text) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {},
      builder: (BuildContext context, LoginState state) {
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
                          borderRadius: BorderRadius.circular(18.sp),
                          color: const Color(0xFFEFEFFA)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: myTextStyle.copyWith(
                            fontSize: 15.5.sp,
                            color: const Color(0xFF8090BA),
                          ),
                          cursorColor: const Color(0xFF8090BA),
                          controller: phoneNumberController,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isFieldEmpty)
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 4.sp),
              child: Text(
                '*This field is required',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15.sp,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 11.w, top: 20.sp),
            child: GestureDetector(
              onTap: () {
                if (phoneNumberController.text.length != 9) {
                  setState(() {
                    isFieldEmpty = true;
                  });
                } else {
                  setState(() {
                    isFieldEmpty = false;
                  });
                  context.read<LoginBloc>().add(
                        SubmitEvent(phoneNumber: phoneNumberController.text),
                      );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.sp),
                    border: Border.all(
                      color: const Color(0xFF6E80B0),
                      width: 0.3.w,
                    )),
                child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Center(
                        child: Text(
                      text,
                      style: myTextStyle.copyWith(
                          color: const Color(0xFF6D61F2), fontSize: 18.sp),
                    ))),
              ),
            ),
          )
        ]);
      },
    );
  }
}
