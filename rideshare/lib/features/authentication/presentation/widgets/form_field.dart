import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/features/authentication/presentation/widgets/text_field.dart';

class PassengerFormField extends StatefulWidget {
  const PassengerFormField(
      {super.key,
      required this.onChanged,
      required this.label,
      required this.hintText});
  final String label;
  final String hintText;
  final Function(String) onChanged;

  @override
  State<PassengerFormField> createState() => _PassengerFormFieldState();
}

class _PassengerFormFieldState extends State<PassengerFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 18.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 1.0.h),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0.sp),
              color: const Color(0xFFEFEFFA),
            ),
            child: CustomTextField(
              onChanged: widget.onChanged,
              label: widget.label,
              controller: TextEditingController(),
              hintText: widget.hintText,
            )),
      ],
    );
  }
}
