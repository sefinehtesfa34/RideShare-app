import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LocationTextField extends StatefulWidget {
  const LocationTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  State<LocationTextField> createState() => _LocationTextFieldState();
}

class _LocationTextFieldState extends State<LocationTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: <FilteringTextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[]')),
      ],
      decoration: decoration(widget.hintText),
      controller: widget.controller,
      focusNode: widget.focusNode,
      // onChanged: (String value) {
      //   widget.controller.text = value;
      // },
    );
  }
}

InputDecoration decoration(String hintText) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    fillColor: const Color(0XFFE5E3F2),
    filled: true,
    border: const OutlineInputBorder(),
    hintText: hintText,
    hintStyle: TextStyle(
      color: const Color(0XFFA0A0A0),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
    ),
    suffixIcon: Transform.scale(
      scale: 0.5,
      child: SvgPicture.asset('images/star.svg'),
    ),
  );
}
