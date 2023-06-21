import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';

class AcceptText extends StatelessWidget {
  const AcceptText(
      {super.key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.errorText,
      required this.type});
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String errorText;
  final Type type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 17.5.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600),
        ),
        Container(
          height: 7.5.h,
          decoration: BoxDecoration(
            color: primaryAccentColor,
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: TextFormField(
            controller: controller,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }
              if (type == int) {
                final int? intValue = int.tryParse(value);
                if (intValue == null) {
                  return "Please enter a valid number.";
                }
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 4.w),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15.5.sp,
                  color: textFieldColor),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
