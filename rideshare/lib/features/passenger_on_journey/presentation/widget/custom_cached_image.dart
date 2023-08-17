import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

/// This widget provides a cached network image with customized features.
class CustomizedCachedImage extends StatelessWidget {
  /// Constructor for CustomizedCachedImage.
  CustomizedCachedImage({
    required this.imageURL,
    required this.width,
    required this.height,
    this.borderRadius = 12,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageURL;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      /// Placeholder during loading
      placeholder: (_, String url) => Stack(
        children: [
          Container(
            color: Colors.grey,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor.withOpacity(0.3),
                  primaryColor.withOpacity(0.9),
                ],
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ],
      ),
      //! Add error Icon
      /// Error widget in case of image loading error
      errorWidget: (_, String url, error) => Icon(Icons.error),
      /// Display the image when loaded successfully
      imageBuilder: (_, ImageProvider imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
