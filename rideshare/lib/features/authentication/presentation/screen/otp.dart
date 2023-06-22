import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../feeds/profile/presentation/screen/drawer.dart';
import '../bloc/otp_bloc.dart';
import '../widgets/redirecting.dart';
import '../widgets/resend.dart';
import '../widgets/verify_button.dart';

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
  List<String> OTP = ['', '', '', ''];
  bool _isRedirecting = false;

  @override
  void initState() {
    super.initState();
    _controllers = List<TextEditingController>.generate(
        4, (int index) => TextEditingController());
    _focusNodes = List<FocusNode>.generate(4, (int index) => FocusNode());
  }

  @override
  void dispose() {
    _focusNodes.map((FocusNode focusNode) => focusNode.dispose);
    super.dispose();
  }

  void _startRedirectTimer(Widget widget) {
    setState(() {
      _isRedirecting = true;
    });

    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => widget,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpVerificationBloc>(
      create: (BuildContext context) => GetIt.instance<OtpVerificationBloc>(),
      child: Scaffold(
        body: BlocConsumer<OtpVerificationBloc, OtpVerificationState>(
          listener: (BuildContext context, OtpVerificationState state) async {
            if (state is OtpVerificationSuccess && !_isRedirecting) {
              _startRedirectTimer(const MyHomePage());
            }
            if (state is OtpVerificationFailure && !_isRedirecting) {
              _startRedirectTimer(const OtpVerificationScreen());
            }
            // Handle state changes, if needed
          },
          builder: (BuildContext context, OtpVerificationState state) {
            if (state is OtpVerificationLoading) {
              // Show loading indicator
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OtpVerificationSuccess ||
                state is OtpVerificationFailure) {
              if (_isRedirecting) {
                return const Redirecting();
              } else {
                // Handle success state
                return const Center(
                  child: Text(
                    'Verification Successful',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            } else if (state is OtpVerificationFailure) {
              // Handle failure state
              return const Center(
                child: Text(
                  'Verification Failed:',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              // Default state
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                            width: 10.w,
                            height: 10.h,
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
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          width: 80.w,
                          height: 10.h,
                          child: Verify(controllers: _controllers, OTP: OTP),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
