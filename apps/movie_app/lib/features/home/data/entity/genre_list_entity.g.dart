// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreEntity _$GenreEntityFromJson(Map<String, dynamic> json) => GenreEntity(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreListEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenreEntityToJson(GenreEntity instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

GenreListEntity _$GenreListEntityFromJson(Map<String, dynamic> json) =>
    GenreListEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenreListEntityToJson(GenreListEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
