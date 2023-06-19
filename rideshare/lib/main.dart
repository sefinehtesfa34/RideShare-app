import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io';

import 'package:rideshare/features/feeds/location/presentation/widgets/select_button.dart';
import 'package:rideshare/features/feeds/profile/presentation/widgets/text_field.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final File? _userPhoto = null;
  final String _fullName = 'Sergio Ramasis';
  String _sex = 'Male';

  void _takePhoto() {}

  void _selectSex(String sex) {
    setState(() {
      _sex = sex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 2.0.h,
                  ),
                  GestureDetector(
                    onTap: _takePhoto,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: _userPhoto != null
                          ? Image.file(_userPhoto!).image
                          : const AssetImage('assets/images/passenger.jpg'),
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  Text(
                    _fullName,
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 2.0.h),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0.sp),
                            color: const Color(0xFFEFEFFA),
                          ),
                          child: CustomTextField(
                            controller: TextEditingController(),
                          )),
                    ],
                  ),
                  SizedBox(height: 2.0.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 2.0.h),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0.sp),
                            color: const Color(0xFFEFEFFA),
                          ),
                          child: CustomTextField(
                            controller: TextEditingController(),
                          )),
                    ],
                  ),
                  SizedBox(height: 2.0.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sex',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 2.0.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _selectSex('Male'),
                            child: Container(
                              width: 20.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: _sex == 'Male'
                                    ? const Color(0xFF6D61F2)
                                    : const Color(0xFFEFEFFA),
                                borderRadius: BorderRadius.circular(18.0.sp),
                              ),
                              child: Center(
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                    color: _sex == 'Male'
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0XFF8090BA),
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0.w),
                          GestureDetector(
                            onTap: () => _selectSex('Female'),
                            child: Container(
                              width: 20.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: _sex == 'Female'
                                    ? const Color(0xFF6D61F2)
                                    : const Color(0xFFEFEFFA),
                                borderRadius: BorderRadius.circular(18.0.sp),
                              ),
                              child: Center(
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                    color: _sex == 'Female'
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0XFF8090BA),
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.0.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 2.0.h),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0.sp),
                            color: const Color(0xFFEFEFFA),
                          ),
                          child: CustomTextField(
                            controller: TextEditingController(),
                          )),
                    ],
                  ),
                  SizedBox(height: 2.0.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ID',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 2.0.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0.sp),
                                color: const Color(0xFFEFEFFA),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.0.sp),
                                    child: Text(
                                      'Pick ID image',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: const Color(0xFF8090BA),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                  Expanded(
                                      child: CustomTextField(
                                    controller: TextEditingController(),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 3.0.h),
                  Center(
                      child: SelectButton(
                    onPressed: () {},
                    buttonName: 'Save',
                    leftPadding: 0.sp,
                    radius: 18.sp,
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
