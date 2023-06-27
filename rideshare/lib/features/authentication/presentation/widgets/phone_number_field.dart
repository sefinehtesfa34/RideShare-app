import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({super.key, required this.controller, this.code});
  final TextEditingController controller;
  final String? code;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 35.0.sp, // Set the desired fixed width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0.sp),
            color: const Color(0xFFEFEFFA),
          ),
          child: TextField(
            readOnly: true,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.0.sp, vertical: 8.0.sp),
              hintText: widget.code??'+251',
              hintStyle: TextStyle(
                color: const Color(0xFF8090BA),
                fontSize: 15.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
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
              keyboardType: TextInputType.phone,
              readOnly: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 20.sp,
                  ),
                  hintText: widget.controller.text,
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
