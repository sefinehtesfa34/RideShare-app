import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.label,
      required this.onChanged})
      : super(key: key);
  final Function(String) onChanged;
  final String hintText;
  final String label;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      keyboardType:
          widget.label == 'Age' ? TextInputType.number : TextInputType.none,
      inputFormatters: [
        widget.label == 'Age'
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter,
        // Other input formatters...
      ],
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: const Color(0xFF8090BA),
          fontSize: 16.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 20.sp),
      ),
    );
  }
}
