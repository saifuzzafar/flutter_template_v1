import 'package:hive/hive.dart';
import 'package:movie_app/features/home/data/db_service/utils/entity_type_id.dart';

part 'movie_box_entity.g.dart';

@HiveType(typeId: BoxEntityTypeId.movieTypeId)
class MovieBoxEntity extends HiveObject {
  @HiveField(0)
  String movieId;

  MovieBoxEntity({required this.movieId});
}
