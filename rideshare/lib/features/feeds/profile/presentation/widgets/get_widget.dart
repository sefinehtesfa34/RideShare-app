
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/drawer_items.dart';

Widget getWidget(DrawerMenuItem menuItem, onTap) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 6.h, // Set the desired height here
        child: ListTile(
          leading: menuItem.icon,
          title: Text(
            menuItem.title,
            style: TextStyle(
              color: const Color(0xFF414141),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: onTap,
        ),
      ),
      const Divider(
        color: Colors.grey,
        thickness: 1,
      )
    ],
  );
}
