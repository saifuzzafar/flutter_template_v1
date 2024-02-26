class MovieDetailsModel {
  String? backdropPath;
  int? budget;
  List<GenreModel>? genres;
  List<ProductionCountryName>? productionCountries;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  int? runtime;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;
  String? releaseDate;
  MovieDetailsModel(
      {this.backdropPath,
      this.budget,
      this.genres,
      this.id,
      this.productionCountries,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.runtime,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.releaseDate});
}

class GenreModel {
  int? id;
  String? name;

  GenreModel({this.id, this.name});
}

class ProductionCountryName {
  String? iso_3166_1;
  String? name;
  ProductionCountryName({this.iso_3166_1, this.name});
}
