import 'package:core/data_base/safe_db_call.dart';
import 'package:core/errors/database_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/di/home_providers.dart';
import 'package:movie_app/features/home/domain/model/home/movie_model.dart';
import 'package:storage_util/box_constants/db_constants.dart';
import 'package:storage_util/model/movie_db_entity.dart';
import 'package:storage_util/storage.dart';

/// This class [LocalDataSource] is used to store data in Either
/// [Hive] or [FlutterSecureStorage] based on use case
class HomeLocalDataSource {
  Storage get _localStorage {
    return HomeProviders.homeLocalStorageProvider;
  }

  HomeLocalDataSource();

  Future<Either<DatabaseError, bool>> saveMovie(
      MovieDbEntity movieBoxEntity) async {
    final response = await safeDbCall(
        _localStorage.setCustomItem<MovieDbEntity>(
            key: DbConstants.movieId, value: movieBoxEntity));

    return response.fold((l) => left(l), (r) => right(true));
  }

  Future<Either<DatabaseError, bool>> deleteMovie(
      MovieDbEntity movieBoxEntity) async {
    final response = await safeDbCall(_localStorage.deleteItem(
      key: DbConstants.movieId,
    ));

    return response.fold((l) => left(l), (r) => right(true));
  }

  Future<Either<DatabaseError, MovieModel>> getMovie(int id) async {
    final response = await safeDbCall(_localStorage.getCustomItem(
      key: "$id",
    ));

    return response.fold((l) => left(l), (r) => right(MovieModel()));
  }
}
