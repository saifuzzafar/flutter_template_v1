import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/constants/movie_app_constants.dart';

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
        print('image base url ${AppConstants.imageBaseUrl}');
        print('image  url $imageUrl');
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
