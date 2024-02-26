class NowPlayingMoviesModel {
  int? page;
  List<NowPlayingMoviesResultModel>? results;
  int? totalPages;
  int? totalResults;

  NowPlayingMoviesModel(
      {this.page, this.results, this.totalPages, this.totalResults});
}

class NowPlayingMoviesResultModel {
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
  num? voteAverage;
  int? voteCount;

  NowPlayingMoviesResultModel(
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
      this.video,
      this.voteAverage,
      this.voteCount});
}
