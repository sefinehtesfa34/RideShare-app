import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class CustomizedCachedImage extends StatelessWidget {
  CustomizedCachedImage(
      {required this.imageURL,
      required this.width,
      required this.height,
      this.borderRadius = 12,
      super.key});
  final double width;
  final double height;
  final String imageURL;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageURL,
        //! Add skeleton
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
        errorWidget: (_, String url, error) => Icon(Icons.error),
        imageBuilder: (_, ImageProvider imageProvider) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius)))));
  }
}
