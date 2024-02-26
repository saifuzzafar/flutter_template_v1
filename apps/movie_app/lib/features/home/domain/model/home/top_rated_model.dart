class TopRatedMoviesModel {
  int? page;
  List<TopRatedMoviesResultModel>? results;
  int? totalPages;
  int? totalResults;

  TopRatedMoviesModel(
      {this.page, this.results, this.totalPages, this.totalResults});
}

class TopRatedMoviesResultModel {
  bool? adult;
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;

  TopRatedMoviesResultModel(
      {this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});
}
