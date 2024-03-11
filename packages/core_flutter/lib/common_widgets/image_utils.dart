import 'dart:io';

import 'package:core_flutter/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ImageUtils extends StatelessWidget {
  final String imageUrl;
  final ImageType imageType;
  final BoxFit fit;
  final double height;
  final double width;

  const ImageUtils(this.imageUrl, this.imageType, this.fit,
      {super.key, this.height = 30, this.width = 30});

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.assets:
        return Image.asset(
          imageUrl,
          height: height,
          width: width,
          fit: fit,
        );
        break;
      case ImageType.network:
        return Image.network(
          AppConstants.imageBaseUrl + imageUrl,
          fit: fit,
          height: height,
          width: width,
        );
        break;

      case ImageType.sdCard:
        return Image.file(File(imageUrl));
        break;
      case ImageType.image:
        return Image(
          image: AssetImage(imageUrl),
          height: height,
          width: width,
          fit: fit,
        );
        break;

      default:
        return Image.asset(imageUrl);
        break;
    }
  }
}

enum ImageType { network, assets, sdCard, image }