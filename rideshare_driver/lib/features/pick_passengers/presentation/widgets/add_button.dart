import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key,required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 20.w,
      height: 3.5.h,
        decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(3)),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: white, size: 2.h),
            
            Text(
              "Add",
              style: TextStyle(
                color: white,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
