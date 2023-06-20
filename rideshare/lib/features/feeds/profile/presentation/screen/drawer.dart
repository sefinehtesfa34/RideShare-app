import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/drawer_items.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _showLogoutConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16.sp,
              ), // Set the desired border radius here
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 20.sp, // Set the desired vertical padding here
              horizontal: 20.sp, // Set the desired horizontal padding here
            ),
            content: const Text('Are you sure you want to logout?'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF6D61F2)),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xFF6D61F2),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFEA4335)),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Perform logout operation here
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Color(0xFFEA4335),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFEFEFFA),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: menuItems.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(
                height: 30.h,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            iconSize: 18.sp,
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
                      ),
                      CircleAvatar(
                        radius: 20.sp,
                        backgroundImage:
                            const AssetImage('assets/images/passenger.jpg'),
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
            final DrawerMenuItem menuItem = menuItems[index - 1];
            if (menuItem.title == 'Log out') {
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
                      onTap: _showLogoutConfirmationDialog,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  )
                ],
              );
            }

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
                    onTap: menuItem.onTap,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
