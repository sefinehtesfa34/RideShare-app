import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialog {
  static Future<void> show(BuildContext context) async {
    final BuildContext dialogContext = context;
    await showDialog<void>(
      context: dialogContext,
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
                        onPressed: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.remove('isLoggedIn');
                          dialogContext.go('/login');
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
}
