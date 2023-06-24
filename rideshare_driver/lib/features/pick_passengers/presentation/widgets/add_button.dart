import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18.w,
      height: 4.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            
          ),
          backgroundColor: primaryColor,
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(Icons.add,
            color: white,
            size: 3.w),
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
