class UpComingMoviesModel {
  int? page;
  List<UpComingResultModel>? results;
  int? totalPages;
  int? totalResults;

  UpComingMoviesModel(
      {this.page, this.results, this.totalPages, this.totalResults});
}

class UpComingResultModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;

  UpComingResultModel(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video});
}
