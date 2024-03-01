import 'package:flutter/widgets.dart';

class ScreenDimensions {
  //movie tiles dimension
  static late double tileHeight;
  static late double tileWidth;
  static late double crousalHeight;

  ScreenDimensions(BuildContext context) {
    tileHeight = SizeHelper.getDimensions(context).height * 0.30;
    tileWidth = SizeHelper.getDimensions(context).width * 0.36;
    crousalHeight = SizeHelper.getDimensions(context).width * 0.40;
  }

//  static Tuple2 getTileDimension(context) {
//
//    var tileHeight = SizeHelper.getDimensions(context).height * 0.30;
//    var tileWidth = screenWidth * 0.36;
//
//    return Tuple2<double, double>(tileHeight, tileWidth);
//  }
}

class SizeHelper {
  static Size _phoneScreenSize(context) {
    return MediaQuery.of(context).size;
  }

  static Size getDimensions(context) {
    var size = _phoneScreenSize(context);
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Size(size.width, size.height);
    } else {
      return Size(size.height, size.width);
    }
  }

  static double width(width, context) {
    var size = getDimensions(context);
    return width * (size.width * size.aspectRatio);
  }

  static double height(height, context) {
    var size = getDimensions(context);
    return height * (size.height * size.aspectRatio);
  }

  static double sp(fontSize, context) {
    var size = getDimensions(context);
    return fontSize * (size.width * size.aspectRatio);
  }
}
