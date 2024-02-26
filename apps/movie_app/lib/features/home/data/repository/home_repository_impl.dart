import 'package:core/errors/network_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:movie_app/features/home/domain/model/home/genre_model.dart';
import 'package:movie_app/features/home/domain/model/home/movie_details_model.dart';
import 'package:movie_app/features/home/domain/model/home/now_playing_model.dart';
import 'package:movie_app/features/home/domain/model/home/popular_movies_model.dart';
import 'package:movie_app/features/home/domain/model/home/top_rated_model.dart';
import 'package:movie_app/features/home/domain/model/home/up_coming_model.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

/// This class [HomeRepositoryImpl] is the implementation of [HomeRepository]
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<NetworkError, GenreListModel>> getGenreList(
      BaseMovieParams params) {
    // TODO: implement getGenreList
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkError, MovieDetailsModel>> getMovieDetails(
      BaseMovieParams params) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkError, NowPlayingMoviesModel>> getNowPlayingMovies(
      BaseMovieParams params) {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkError, PopularMoviesModel>> getPopularMovies(
      BaseMovieParams params) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkError, TopRatedMoviesModel>> getTopRatedMovies(
      BaseMovieParams params) {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkError, UpComingMoviesModel>> getUpComingMovies(
      BaseMovieParams params) {
    // TODO: implement getUpComingMovies
    throw UnimplementedError();
  }
}
