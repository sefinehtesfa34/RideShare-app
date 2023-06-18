import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  List<TextEditingController> _controllers = [];
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controllers = List<TextEditingController>.generate(
        4, (int index) => TextEditingController());
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                      focusNode: _focusNode,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(fontSize: 20.sp),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.sp)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15.sp)),
                        fillColor: const Color(0xFFEFEFFA),
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              TextButton(
                onPressed: () => {},
                child: const Text(
                  "Didn't receive a code?",
                  style: TextStyle(
                    color: Color(0XFF6E80B0),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  "Resend",
                  style: TextStyle(
                    color: const Color(0xFF6D61F2),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  width: 80.w,
                  height: 10.h,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6D61F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Verify',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ), // Adjust the spacing between the text and image
                        Image.asset(
                          'assets/images/arrow.png',
                          width:
                              24.sp, // Adjust the width of the image as needed
                          height:
                              24.sp, // Adjust the height of the image as needed
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
