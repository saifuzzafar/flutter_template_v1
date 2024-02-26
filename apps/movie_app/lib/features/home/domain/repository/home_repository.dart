import 'package:core/errors/network_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/domain/model/home/genre_model.dart';
import 'package:movie_app/features/home/domain/model/home/movie_details_model.dart';
import 'package:movie_app/features/home/domain/model/home/now_playing_model.dart';
import 'package:movie_app/features/home/domain/model/home/popular_movies_model.dart';
import 'package:movie_app/features/home/domain/model/home/top_rated_model.dart';
import 'package:movie_app/features/home/domain/model/home/up_coming_model.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

/// This class [HomeRepository] is the blueprint of network api call
abstract class HomeRepository {
  Future<Either<NetworkError, TopRatedMoviesModel>> getTopRatedMovies(
      BaseMovieParams params);
  Future<Either<NetworkError, PopularMoviesModel>> getPopularMovies(
      BaseMovieParams params);
  Future<Either<NetworkError, NowPlayingMoviesModel>> getNowPlayingMovies(
      BaseMovieParams params);
  Future<Either<NetworkError, UpComingMoviesModel>> getUpComingMovies(
      BaseMovieParams params);
  Future<Either<NetworkError, MovieDetailsModel>> getMovieDetails(
      BaseMovieParams params);
  Future<Either<NetworkError, GenreListModel>> getGenreList(
      BaseMovieParams params);
}
