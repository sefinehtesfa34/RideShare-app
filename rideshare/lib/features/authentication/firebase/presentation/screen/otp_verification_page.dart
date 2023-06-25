import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../presentation/bloc/firebase/bloc/firebase_bloc.dart';
import '../../../presentation/bloc/firebase/bloc/firebase_state.dart';
import '../../../presentation/widgets/redirecting.dart';
import '../../../presentation/widgets/resend.dart';
import '../../../presentation/widgets/verify_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // ignore: always_specify_types
  List<TextEditingController> _controllers = [];
  List<FocusNode> _focusNodes = [];
  // ignore: always_specify_types, non_constant_identifier_names
  List<String> OTP = ['', '', '', '', '', ''];

  @override
  void initState() {
    super.initState();
    _controllers = List<TextEditingController>.generate(
        6, (int index) => TextEditingController());
    _focusNodes = List<FocusNode>.generate(6, (int index) => FocusNode());
  }

  @override
  void dispose() {
    _focusNodes.map((FocusNode focusNode) => focusNode.dispose);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FirebaseBloc>(
      create: (BuildContext context) => GetIt.instance<FirebaseBloc>(),
      child: Scaffold(
        body: BlocConsumer<FirebaseBloc, FirebaseState>(
            listener: (BuildContext context, FirebaseState state) async {
          if (state.status == FirebaseOtpStatus.failure) {
            context.go('/signUp');
          }
          if (state.status == FirebaseOtpStatus.success) {
            if (state.isSignedUp) {
              context.go('/home');
            } else {
              context.go('/signUp');
            }
          }
          // Handle state changes, if needed
        }, builder: (BuildContext context, FirebaseState state) {
          if (state.status == FirebaseOtpStatus.loading) {
            return const Center(
              child: Redirecting(),
            );
          }
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verification',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                      color: const Color(0xFF6D61F2),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    'Enter the number we just sent you\non your phone.',
                    style: TextStyle(
                      color: Color(0xFF6E80B0),
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List<SizedBox>.generate(
                      _controllers.length,
                      (int index) => SizedBox(
                        width: 14.w,
                        height: 7.h,
                        child: TextField(
                          onChanged: (String value) {
                            OTP[index] = value;
                            if (value.isNotEmpty) {
                              _focusNodes[index].nextFocus();
                            } else {
                              _focusNodes[index].previousFocus();
                            }
                          },
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: TextStyle(fontSize: 20.sp),
                          decoration: InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            fillColor: const Color(0xFFEFEFFA),
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  const Text(
                    "Didn't receive a code?",
                    style: TextStyle(
                      color: Color(0XFF6E80B0),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Resend(),
                  SizedBox(height: 3.h),
                  SizedBox(
                    width: 70.w,
                    height: 8.h,
                    child: Verify(controllers: _controllers, OTP: OTP),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
