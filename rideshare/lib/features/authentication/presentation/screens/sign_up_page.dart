import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rideshare/core/utils/colors.dart';
import 'package:rideshare/features/authentication/presentation/bloc/signup/sign_up_bloc.dart';

import '../widgets/accept_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File imageFile = File("");
  String pickImageText = "Insert Image";
  final formkey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                                imageFile = File(pickedImage.path);
                                pickImageText = "";
                              });
                            }
                          },
                          // ignore: unnecessary_null_comparison
                          child: imageFile.path != ""
                              ? Image.file(
                                  imageFile,
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
                              hintText: "Insert full name"),
                          SizedBox(height: 2.h),
                          AcceptText(
                              controller: ageController,
                              label: 'Age',
                              hintText: "Insert age"),
                          SizedBox(height: 2.h),
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
                                  BlocProvider.of<SignUpBloc>(context).add(
                                      SignUpEvent(
                                          age: int.parse(ageController.text),
                                          fullName: fullNameController.text,
                                          idImage: imageFile));
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
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: white),
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
    );
  }
}
