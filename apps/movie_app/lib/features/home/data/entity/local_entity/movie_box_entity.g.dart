// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_box_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieBoxEntityAdapter extends TypeAdapter<MovieBoxEntity> {
  @override
  final int typeId = 1;

  @override
  MovieBoxEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieBoxEntity(
      movieId: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieBoxEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.movieId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieBoxEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
