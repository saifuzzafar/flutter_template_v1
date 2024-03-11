import 'package:hive/hive.dart';
import 'package:movie_app/features/home/data/db_service/utils/db_constants.dart';
import 'package:movie_app/features/home/data/entity/local_entity/movie_box_entity.dart';

class MovieDao {
  Future<void> saveMovie(MovieBoxEntity movieBoxEntity) async {
    var box = await Hive.openBox(DbConstants.movieBox);
    await box.put(DbConstants.movieId, movieBoxEntity);
  }

  Future<void> deleteMovie(MovieBoxEntity movieBoxEntity) async {
    var box = await Hive.openBox(DbConstants.movieBox);
    await box.delete(
      DbConstants.movieId,
    );
  }

  Future<MovieBoxEntity> getMovie(int id) async {
    var box = await Hive.openBox(DbConstants.movieBox);
    return box.get(id);
  }
}
