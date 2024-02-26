import 'package:json_annotation/json_annotation.dart';

part 'top_rated_movies_entity.g.dart';

@JsonSerializable()
class TopRatedMoviesEntity {
  @JsonKey(name: 'page')
  late final int? page;

  @JsonKey(name: 'results')
  late final List<TopRatedMoviesResult>? results;
  @JsonKey(name: 'total_pages')
  late int? totalPages;
  @JsonKey(name: 'total_results')
  late int? totalResults;

  TopRatedMoviesEntity(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory TopRatedMoviesEntity.fromJson(Map<String, dynamic> json) =>
      _$TopRatedMoviesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMoviesEntityToJson(this);
}

@JsonSerializable()
class TopRatedMoviesResult {
  late bool? adult;
  @JsonKey(name: 'backdrop_path')
  late String? backdropPath;
  @JsonKey(name: 'genre_ids')
  late List<int>? genreIds;
  late int? id;
  @JsonKey(name: 'original_language')
  late String? originalLanguage;
  @JsonKey(name: 'original_title')
  late String? originalTitle;
  late String? overview;
  late num? popularity;
  @JsonKey(name: 'poster_path')
  late String? posterPath;
  @JsonKey(name: 'release_date')
  late String? releaseDate;
  late String? title;
  late bool? video;
  @JsonKey(name: 'vote_average')
  late num? voteAverage;
  @JsonKey(name: 'vote_count')
  late int? voteCount;
  TopRatedMoviesResult(
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
  factory TopRatedMoviesResult.fromJson(Map<String, dynamic> json) =>
      _$TopRatedMoviesResultFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMoviesResultToJson(this);
}
