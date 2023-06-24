import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../bloc/otp/otp_bloc.dart';

// ignore: must_be_immutable
class Verify extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Verify({super.key, required this.controllers, required this.OTP});
  List<TextEditingController> controllers = [];
  List<String> OTP = [];
  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        bool isFieldEmpty = widget.controllers
            .any((TextEditingController controller) => controller.text.isEmpty);
        if (isFieldEmpty) {
          // Show a required field message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.white,
                content: Text(
                  'All fields are required.',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          );
        } else {
          context.read<OtpVerificationBloc>().add(VerifyOtpEvent(
              otp: widget.OTP.join(), phoneNumber: '0978664897'));
        }
      },
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
            width: 24.sp, // Adjust the width of the image as needed
            height: 24.sp, // Adjust the height of the image as needed
          ),
        ],
      ),
    );
  }
}
