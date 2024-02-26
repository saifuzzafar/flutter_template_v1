import 'package:core/errors/network_error.dart';
import 'package:core/network/safe_api_call/safe_api_call.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/home/data/api_service/home_api_service.dart';
import 'package:movie_app/features/home/data/endpoints_constants/home_options.dart';
import 'package:movie_app/features/home/domain/model/home/movie_details_model.dart';
import 'package:movie_app/features/home/domain/model/home/now_playing_model.dart';
import 'package:movie_app/features/home/domain/model/home/popular_movies_model.dart';
import 'package:movie_app/features/home/domain/model/home/top_rated_model.dart';
import 'package:movie_app/features/home/domain/model/home/up_coming_model.dart';
import 'package:movie_app/features/home/domain/use_case/base_movie_params.dart';

/// This class [HomeRemoteDataSource] is used to fetch Api from network
/// using [HomeApiService] class.
class HomeRemoteDataSource {
  final HomeApiService _homeApiService;

  HomeRemoteDataSource(this._homeApiService);

  Future<Either<NetworkError, TopRatedMoviesModel>> getTopRatedMovies(
      BaseMovieParams params) async {
    final response = await safeApiCall(_homeApiService.getTopRatedMovies(
        commonOptions: baseToRequestParams(params: params)));
    return response.fold((l) => left(l), (r) {
      return Right(TopRatedMoviesModel(
          page: r.data.page,
          results: r.data.results!
              .map((e) => TopRatedMoviesResultModel(id: e.id, title: e.title))
              .toList(),
          totalPages: r.data.totalPages,
          totalResults: r.data.totalResults));
    });
  }

  Future<Either<NetworkError, PopularMoviesModel>> getPopularMovies(
      BaseMovieParams params) async {
    final response = await safeApiCall(_homeApiService.getTopRatedMovies(
        commonOptions: baseToRequestParams(params: params)));
    return response.fold((l) => left(l), (r) {
      return Right(PopularMoviesModel(
          page: r.data.page,
          results: r.data.results!
              .map((e) => PopularMoviesResultModel(id: e.id, title: e.title))
              .toList(),
          totalPages: r.data.totalPages,
          totalResults: r.data.totalResults));
    });
  }

  Future<Either<NetworkError, NowPlayingMoviesModel>> getNowPlayingMovies(
      BaseMovieParams params) async {
    final response = await safeApiCall(_homeApiService.getTopRatedMovies(
        commonOptions: baseToRequestParams(params: params)));
    return response.fold((l) => left(l), (r) {
      return Right(NowPlayingMoviesModel(
          page: r.data.page,
          results: r.data.results!
              .map((e) => NowPlayingMoviesResultModel(id: e.id, title: e.title))
              .toList(),
          totalPages: r.data.totalPages,
          totalResults: r.data.totalResults));
    });
  }

  Future<Either<NetworkError, UpComingMoviesModel>> getUpComingMovies(
      BaseMovieParams params) async {
    final response = await safeApiCall(_homeApiService.getTopRatedMovies(
        commonOptions: baseToRequestParams(params: params)));
    return response.fold((l) => left(l), (r) {
      return Right(UpComingMoviesModel(
          page: r.data.page,
          results: r.data.results!
              .map((e) => UpComingResultModel(id: e.id, title: e.title))
              .toList(),
          totalPages: r.data.totalPages,
          totalResults: r.data.totalResults));
    });
  }

  Future<Either<NetworkError, MovieDetailsModel>> getMovieDetails(
      BaseMovieParams params) async {
    final response = await safeApiCall(_homeApiService.getTopRatedMovies(
        commonOptions: baseToRequestParams(params: params)));
    return response.fold((l) => left(l), (r) {
      return Right(MovieDetailsModel(id: r.data.page));
    });
  }

  // Future<Either<NetworkError, GenreListModel>> getGenreList(
  //     BaseMovieParams params) async {
  //   final response = await safeApiCall(_homeApiService.getTopRatedMovies(
  //       commonOptions: baseToRequestParams(params: params)));
  //   return response.fold((l) => left(l), (r) {
  //     return Right(GenreListModel(
  //
  //     ));
  //   });
  // }

  CommonRequestOptions baseToRequestParams({required BaseMovieParams params}) {
    return CommonRequestOptions(language: params.language, page: params.page);
  }
}
