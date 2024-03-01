import 'package:json_annotation/json_annotation.dart';

part 'genre_list_entity.g.dart';

@JsonSerializable()
class GenreEntity {
  @JsonKey(name: 'genres')
  List<GenreListEntity>? genres;

  GenreEntity({this.genres});

  factory GenreEntity.fromJson(Map<String, dynamic> json) =>
      _$GenreEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GenreEntityToJson(this);
}

@JsonSerializable()
class GenreListEntity {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  GenreListEntity({this.id, this.name});

  factory GenreListEntity.fromJson(Map<String, dynamic> json) =>
      _$GenreListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListEntityToJson(this);
}
