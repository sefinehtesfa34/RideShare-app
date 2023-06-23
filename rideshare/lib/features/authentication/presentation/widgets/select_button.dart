import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({
    Key? key,
    required this.leftPadding,
    required this.onPressed,
    required this.buttonName,
    required this.radius,
    this.child,
    this.rightPadding,
  }) : super(key: key);
  final Widget? child;
  final double? rightPadding;
  final double radius;
  final String buttonName;
  final VoidCallback onPressed;
  final double leftPadding;

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.leftPadding, right: widget.rightPadding ?? 0),
      child: Container(
        width: 339.w,
        height: 8.h,
        margin: EdgeInsets.only(left: 2.sp, right: 2.sp, top: 3.sp),
        child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF6D61F2)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
              ),
            ),
            child: widget.child),
      ),
    );
  }
}
