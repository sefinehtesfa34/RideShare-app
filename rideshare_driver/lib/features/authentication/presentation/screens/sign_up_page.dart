import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../../../../core/utils/colors.dart';
import '../bloc/signup/sign_up_bloc.dart';
import '../widgets/accept_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File profileImageFile = File("");
  File driverLicenseImageFile = File("");
  String pickImageText = "Insert Image";
  bool showPickImageError = false;

  final formkey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController driverLicenceController = TextEditingController();
  final TextEditingController drivingExperienceController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Authenticatoin successful: I am ${state.profile.fullName}"),
          ));
        }
        if (state is SignUpFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.only(top: 3.h, bottom: 0.5.h),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "Poppins",
                      color: const Color(0xFF6E80B0),
                    ),
                  ),
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? pickedImage = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (pickedImage != null) {
                                setState(() {
                                  profileImageFile = File(pickedImage.path);
                                  pickImageText = "";
                                });
                              }
                            },
                            // ignore: unnecessary_null_comparison
                            child: profileImageFile.path != ""
                                ? Image(
                                    image: FileImage(profileImageFile),
                                    fit: BoxFit.cover,
                                    width: 20.w,
                                    height: 20.h,
                                  )
                                : Container(
                                    width: 20.w,
                                    height: 12.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/profile_icon.png'),
                                      ),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.bottomRight,
                                      child: Icon(
                                        Icons.edit_outlined,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          pickImageText,
                          style: TextStyle(
                            fontSize: 16.5.sp,
                            fontFamily: "Poppins",
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 2.h),
                            AcceptText(
                              controller: fullNameController,
                              label: 'Full name',
                              hintText: "Insert full name",
                              errorText: "Please enter a full name",
                              type: String,
                            ),
                            SizedBox(height: 2.h),
                            AcceptText(
                              controller: driverLicenceController,
                              label: 'Driver Licence Number',
                              hintText: "Insert Driver Licence Number",
                              errorText: "Please enter a driver license number",
                              type: int,
                            ),
                            SizedBox(height: 2.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "License Image",
                                  style: TextStyle(
                                      fontSize: 17.5.sp,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  height: 7.5.h,
                                  decoration: BoxDecoration(
                                    color: primaryAccentColor,
                                    borderRadius: BorderRadius.circular(5.w),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.0.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        driverLicenseImageFile.path == ""
                                            ? Text(
                                                "Pick License Image",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 15.5.sp,
                                                    color: textFieldColor),
                                              )
                                            : Image(
                                                image: FileImage(
                                                    driverLicenseImageFile),
                                                fit: BoxFit.cover,
                                              ),
                                        InkWell(
                                          onTap: () async {
                                            final ImagePicker picker =
                                                ImagePicker();
                                            final XFile? pickedImage =
                                                await picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (pickedImage != null) {
                                              setState(() {
                                                driverLicenseImageFile =
                                                    File(pickedImage.path);
                                                pickImageText = "";
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: 8.w,
                                            height: 8.h,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: white,
                                              size: 6.w,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  showPickImageError
                                      ? "Please pick a license Image"
                                      : "",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            AcceptText(
                              controller: drivingExperienceController,
                              label: 'Driving Experience(year)',
                              hintText: "Yeas of driving experience",
                              errorText:
                                  "Please enter years of driving experience",
                              type: int,
                            ),
                            SizedBox(height: 2.h),
                            AcceptText(
                              controller: ageController,
                              label: 'Age',
                              hintText: "Insert age",
                              errorText: "please enter your age",
                              type: int,
                            ),
                            SizedBox(height: 2.h),
                            AcceptText(
                              controller: addressController,
                              label: 'Address',
                              hintText: "Your location",
                              errorText: "Please enter your address",
                              type: String,
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              height: 8.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4.w),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    if (driverLicenseImageFile.path == "") {
                                      setState(() {
                                        showPickImageError = true;
                                      });
                                    } else {
                                      BlocProvider.of<SignUpBloc>(context).add(
                                          SignUpEvent(
                                              age:
                                                  int.parse(ageController.text),
                                              fullName: fullNameController.text,
                                              idImage: profileImageFile,
                                              address: addressController.text,
                                              driverLicenseNumber: int.parse(
                                                  driverLicenceController.text),
                                              licenseImage:
                                                  driverLicenseImageFile,
                                              experienceYear: int.parse(
                                                  drivingExperienceController
                                                      .text)));
                                    }
                                  }
                                },
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25.w),
                                              child: BlocBuilder<SignUpBloc,
                                                  SignUpState>(
                                                builder: (context, state) {
                                                  return state is SignUpLoading
                                                      ? const CircularProgressIndicator(
                                                          color: white,
                                                        )
                                                      : Text(
                                                          "Submit",
                                                          style: TextStyle(
                                                              fontSize: 20.sp,
                                                              color: white),
                                                        );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5.w),
                                              child: const Image(
                                                  image: AssetImage(
                                                      "assets/images/right_arrow.png")),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 7.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
