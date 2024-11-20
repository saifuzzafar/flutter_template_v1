// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_db_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDbEntityAdapter extends TypeAdapter<MovieDbEntity> {
  @override
  final int typeId = 1;

  @override
  MovieDbEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDbEntity(
      movieId: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDbEntity obj) {
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
      other is MovieDbEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
