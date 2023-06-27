import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'back_arrow_button.dart';

class DrawerHeadWidget extends StatefulWidget {
  const DrawerHeadWidget({super.key});

  @override
  State<DrawerHeadWidget> createState() => _DrawerHeadWidgetState();
}

class _DrawerHeadWidgetState extends State<DrawerHeadWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BackArrowButton(
                onpressed: () => <void>{
                      Navigator.pop(context),
                    }),
            CircleAvatar(
              radius: 20.sp,
              backgroundImage: const AssetImage('assets/images/passenger.png'),
            ),
            SizedBox(height: 2.h),
            Text(
              'Sergio Ramasis',
              style: TextStyle(
                color: const Color(0xFF5A5A5A),
                fontSize: 16.sp,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              '+251 923897623',
              style: TextStyle(
                color: const Color(0xFF8090BA),
                fontSize: 12.sp,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}