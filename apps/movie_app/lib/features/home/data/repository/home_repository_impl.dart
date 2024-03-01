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
    return _homeRemoteDataSource.getGenreList(params);
  }

  @override
  Future<Either<NetworkError, MovieDetailsModel>> getMovieDetails(
      BaseMovieParams params) {
    return _homeRemoteDataSource.getMovieDetails(params);
  }

  @override
  Future<Either<NetworkError, NowPlayingMoviesModel>> getNowPlayingMovies(
      BaseMovieParams params) {
    return _homeRemoteDataSource.getNowPlayingMovies(params);
  }

  @override
  Future<Either<NetworkError, PopularMoviesModel>> getPopularMovies(
      BaseMovieParams params) {
    return _homeRemoteDataSource.getPopularMovies(params);
  }

  @override
  Future<Either<NetworkError, TopRatedMoviesModel>> getTopRatedMovies(
      BaseMovieParams params) {
    return _homeRemoteDataSource.getTopRatedMovies(params);
  }

  @override
  Future<Either<NetworkError, UpComingMoviesModel>> getUpComingMovies(
      BaseMovieParams params) {
    return _homeRemoteDataSource.getUpComingMovies(params);
  }
}
