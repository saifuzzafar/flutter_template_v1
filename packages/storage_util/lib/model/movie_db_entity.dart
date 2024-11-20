import 'package:hive/hive.dart';
import 'package:storage_util/box_constants/entity_type_id.dart';

part 'movie_db_entity.g.dart';

@HiveType(typeId: BoxEntityTypeId.movieTypeId)
class MovieDbEntity extends HiveObject {
  @HiveField(0)
  final String movieId;

  MovieDbEntity({required this.movieId});
}
