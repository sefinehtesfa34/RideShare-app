import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;
  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImageFromGallery,
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 11.h,
            child: (_pickedImage != null) ? Image(
            width: 56.w,
            height: 22.h,
            fit: BoxFit.cover,
            image: 
              FileImage(File(_pickedImage!.path))
            
          ): Icon(Icons.person_outlined,size: 50.sp),),
          
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 8.h,
              width: 8.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: _pickImageFromGallery,
                icon: SvgPicture.asset('assets/images/fluent_edit.svg'),
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
