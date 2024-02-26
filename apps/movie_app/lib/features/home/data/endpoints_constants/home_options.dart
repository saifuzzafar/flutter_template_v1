import 'package:retrofit/http.dart';

/// This class [HomeOptions] is used to contain all Api
/// Query, Path, Post Body parameter related to [home] feature.
class HomeRequestOptions {
  static const String language = 'language';
  static const String page = 'page';
}

class CommonRequestOptions {
  @Query(HomeRequestOptions.language)
  final String language;

  @Query(HomeRequestOptions.page)
  final int page;

  CommonRequestOptions({required this.language, required this.page});
}
