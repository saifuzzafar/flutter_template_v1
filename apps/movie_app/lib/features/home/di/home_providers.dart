import 'package:flutter/material.dart';
import 'package:movie_app/di/app_provider.dart';
import 'package:movie_app/features/home/data/api_service/home_api_service.dart';
import 'package:movie_app/features/home/data/data_source/local_data_source/local_data_source.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:movie_app/features/home/data/repository/home_repository_impl.dart';
import 'package:movie_app/features/home/domain/use_case/genre_list_usecase.dart';
import 'package:movie_app/features/home/domain/use_case/now_playing_usecase.dart';
import 'package:movie_app/features/home/domain/use_case/popular_movies_usecase.dart';
import 'package:movie_app/features/home/domain/use_case/top_rated_usecase.dart';
import 'package:movie_app/features/home/domain/use_case/up_coming_movies_usecase.dart';
import 'package:movie_app/features/home/presentation/cubit/genere_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/now_playing_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/popular_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/up_coming_cubit.dart';
import 'package:storage_util/box_constants/db_constants.dart';
import 'package:storage_util/storage.dart';
import 'package:storage_util/storage_factory.dart';

@visibleForTesting
HomeProviders? testHomeProvider;

class HomeProviders {
  HomeProviders._();

  late HomeApiService homeApiService;
  late HomeRemoteDataSource homeRemoteDataSource;
  late HomeLocalDataSource homeLocalDataSource;
  late HomeRepositoryImpl homeRepositoryImpl;
  late NowPlayingMoviesCubit nowPlayingMoviesCubit;
  late NowPlayingUseCase nowPlayingUseCase;
  late GenreCubit genreCubit;
  late GenreListUseCase genreListUseCase;
  late TopRatedMoviesUseCase topRatedMoviesUseCase;
  late TopRatedMoviesCubit topRatedMoviesCubit;
  late PopularMoviesUseCase popularMoviesUseCase;
  late PopularMoviesCubit popularMoviesCubit;
  late UpComingMoviesUseCase upComingMoviesUseCase;
  late UpcomingMoviesCubit upcomingMoviesCubit;

  static late Storage _homeLocalStorageProvider;
  static Storage get homeLocalStorageProvider {
    return _homeLocalStorageProvider;
  }

  void init() {
    homeApiService = HomeApiService(AppProviders.appDio);
    homeRemoteDataSource = HomeRemoteDataSource(homeApiService);

    homeLocalDataSource = HomeLocalDataSource();
    homeRepositoryImpl =
        HomeRepositoryImpl(homeRemoteDataSource, homeLocalDataSource);

    nowPlayingUseCase = NowPlayingUseCase(homeRepositoryImpl);
    nowPlayingMoviesCubit = NowPlayingMoviesCubit(nowPlayingUseCase);
    genreListUseCase = GenreListUseCase(homeRepositoryImpl);
    genreCubit = GenreCubit(genreListUseCase);

    topRatedMoviesUseCase = TopRatedMoviesUseCase(homeRepositoryImpl);
    topRatedMoviesCubit = TopRatedMoviesCubit(topRatedMoviesUseCase);

    popularMoviesUseCase = PopularMoviesUseCase(homeRepositoryImpl);
    popularMoviesCubit = PopularMoviesCubit(popularMoviesUseCase);

    upComingMoviesUseCase = UpComingMoviesUseCase(homeRepositoryImpl);
    upcomingMoviesCubit = UpcomingMoviesCubit(upComingMoviesUseCase);
  }

  static void dbSetup() {
    _homeLocalStorageProvider = StorageFactory.getStorage(
        isSecure: false, boxName: DbConstants.movieBox);
  }

  static instance() {
    final instance = testHomeProvider ?? HomeProviders._();
    if (testHomeProvider == null) {
      instance.init();
    }
    return instance;
  }
}
