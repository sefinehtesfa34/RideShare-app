import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({
    Key? key,
    required this.leftPadding,
    required this.onPressed,
    required this.buttonName,
    required this.radius,
    required this.child,
  }) : super(key: key);
  final Widget? child;
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
      padding: EdgeInsets.only(left: widget.leftPadding),
      child: Container(
        width: 339.sp,
        height: 30.sp,
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
          child: widget.child
        ),
      ),
    );
  }
}
