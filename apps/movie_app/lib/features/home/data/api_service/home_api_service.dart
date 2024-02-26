import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/endpoints_constants/home_endpoints.dart';
import 'package:movie_app/features/home/data/endpoints_constants/home_options.dart';
import 'package:movie_app/features/home/data/entity/top_rated_movies_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

/// This class [HomeApiService] is responsible
/// to include api calls related to the home feature
/// @RestApi is annotation which generate a g.dart file which contain implementation
/// of all abstract methods
@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeEndpoints.topRatedMovies)
  Future<HttpResponse<TopRatedMoviesEntity>> getTopRatedMovies({
    required CommonRequestOptions commonOptions,
  });
  @GET(HomeEndpoints.popularMovies)
  Future<HttpResponse<TopRatedMoviesEntity>> getPopularMovies({
    required CommonRequestOptions commonOptions,
  });
  @GET(HomeEndpoints.nowPlayingMovies)
  Future<HttpResponse<TopRatedMoviesEntity>> getNowPlayingMovies({
    required CommonRequestOptions commonOptions,
  });
  @GET(HomeEndpoints.upComingMovies)
  Future<HttpResponse<TopRatedMoviesEntity>> getUpComingMovies({
    required CommonRequestOptions commonOptions,
  });
  @GET(HomeEndpoints.movieDetails)
  Future<HttpResponse<TopRatedMoviesEntity>> getMovieDetails({
    required CommonRequestOptions commonOptions,
  });
  @GET(HomeEndpoints.genreList)
  Future<HttpResponse<TopRatedMoviesEntity>> getGenreList({
    required CommonRequestOptions commonOptions,
  });
}
