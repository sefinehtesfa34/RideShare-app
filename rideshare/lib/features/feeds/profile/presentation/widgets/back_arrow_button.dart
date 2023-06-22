import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackArrowButton extends StatefulWidget {
  const BackArrowButton({super.key, required this.onpressed});
  final VoidCallback onpressed;

  @override
  State<BackArrowButton> createState() => _BackArrowButtonState();
}

class _BackArrowButtonState extends State<BackArrowButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 18.sp,
          onPressed: widget.onpressed,
        ),
        SizedBox(width: 1.w),
        Text(
          'Back',
          style: TextStyle(
            color: const Color(0xFF86858A),
            fontFamily: 'Poppins',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
