import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField(
      {super.key, required this.code, required this.phoneNumber});
  final String code;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0.sp),
              color: const Color(0xFFEFEFFA),
            ),
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14.0.sp, vertical: 8.0.sp),
                hintText: code,
                hintStyle: TextStyle(
                  color: const Color(0xFF8090BA),
                  fontSize: 15.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: const Color(0xFFEFEFFA),
            ),
            child: TextField(
              onChanged: (String value) {
                // Handle the phone number input change
              },
              keyboardType: TextInputType.phone,
              readOnly: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 20.sp,
                  ),
                  hintText: phoneNumber,
                  hintStyle: TextStyle(
                    color: const Color(0xFF8090BA),
                    fontSize: 15.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}