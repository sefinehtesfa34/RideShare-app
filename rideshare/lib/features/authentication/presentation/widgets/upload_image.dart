import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

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
          Image(
            width: 100,
            height: 100,
            image: (_pickedImage != null)
                ? NetworkImage(_pickedImage!.path)
                : Image.network('assets/images/pick_image.jpg').image,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: _pickImageFromGallery,
                icon: SvgPicture.asset('images/fluent_edit.svg'),
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
