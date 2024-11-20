import 'package:flutter/material.dart';

class MovieAppConstants {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const netFlexLogoUrl = 'assets/images/netflix_logo.png';
  static const avengerImageUrl = 'assets/images/avengers.jpg';

  static const String apiKey = "b050f1194fbede184f8dc1b98fd14160";
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/original';

  //Unit testing mock file routes

  static const String topRatedMockUrl = 'assets/top_rated_false_response.json';
}

enum ImageType { network, assets, sdCard, image }

enum ButtonType { iconButton, rawMaterialButton }

enum LanguageType {
  english,
}

extension LanguageTypeExt on LanguageType {
  String? get name {
    switch (this) {
      case LanguageType.english:
        return "en-US";
      default:
        return null;
    }
  }
}
