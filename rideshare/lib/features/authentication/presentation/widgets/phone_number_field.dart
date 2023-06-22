import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
    required this.onCodeChanged,
    required this.onPhoneNumberChanged
  });
  final Function(String) onPhoneNumberChanged;
  final Function(String) onCodeChanged;

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
            onChanged: widget.onCodeChanged,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.0.sp, vertical: 8.0.sp),
              hintText: '+251',
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
              onChanged: widget.onPhoneNumberChanged,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 20.sp,
                  ),
                  hintText: '927897654',
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
