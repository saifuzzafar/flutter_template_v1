import 'package:core/core/base_usecase/params.dart';

class BaseMovieParams extends Params {
  final String language;
  final int page;

  BaseMovieParams({this.page = 1, this.language = "en-US"});
}
