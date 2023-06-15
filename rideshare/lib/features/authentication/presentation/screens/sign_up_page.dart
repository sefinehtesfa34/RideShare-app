import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File imageFile = File("");
  String pickImageText = "Insert Image";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.h, bottom: 0.5.h),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 25.sp,
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
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? pickedImage =
                      await picker.pickImage(source: ImageSource.gallery);
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
                        width: 14.w,
                        height: 12.h,
                      )
                    : Container(
                        width: 20.w,
                        height: 12.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile_icon.png'),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.black,
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
                fontSize: 15.sp,
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
                const AcceptText(
                    label: 'Full name', hintText: "Insert full name"),
                SizedBox(height: 2.h),
                const AcceptText(label: 'Age', hintText: "Insert age"),
                SizedBox(height: 2.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Sex",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 25.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(4.w),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "Poppins",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 3.h),
                        Container(
                          width: 25.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(239, 239, 250, 1),
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          child: Center(
                            child: Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color.fromRGBO(128, 144, 186, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Phone Number",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: AcceptText(label: '', hintText: "+251"),
                        ),
                        SizedBox(width: 2.h),
                        const Expanded(
                          flex: 5,
                          child: AcceptText(label: '', hintText: ""),
                        ),
                      ],
                    ),
                  ],
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
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 1.w),
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
    );
  }
}

class AcceptText extends StatelessWidget {
  const AcceptText({
    super.key,
    required this.label,
    required this.hintText,
  });

  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w600),
        ),
        Container(
          height: 6.5.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(239, 239, 250, 1),
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 4.w),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15.5.sp,
                  color: const Color.fromRGBO(128, 144, 186, 1)),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "ID",
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600),
        ),
        Container(
          height: 6.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(239, 239, 250, 1),
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Pick ID Image',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Poppins",
                    color: const Color.fromRGBO(128, 144, 186, 1),
                  ),
                ),
                SizedBox(height: 2.h),
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? pickedImage =
                        await picker.pickImage(source: ImageSource.gallery);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 4.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
