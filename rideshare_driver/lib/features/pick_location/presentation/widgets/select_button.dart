import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    Key? key,
    required this.onPressed,
    required this.buttonName,
    
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.sp),
      child: Container(
        width: 339.sp,
        height: 30.sp,
        margin: EdgeInsets.only(left: 2.sp, right: 2.sp, top: 3.sp),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
