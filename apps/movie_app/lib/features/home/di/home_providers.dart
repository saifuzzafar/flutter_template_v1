import 'package:dio/dio.dart';
import 'package:movie_app/di/app_provider.dart';
import 'package:movie_app/features/home/data/api_service/home_api_service.dart';
import 'package:movie_app/features/home/data/data_source/local_data_source/local_data_source.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:movie_app/features/home/data/db_service/dao/movies_dao.dart';
import 'package:movie_app/features/home/data/db_service/hive_db_service.dart';
import 'package:movie_app/features/home/data/repository/home_repository_impl.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
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

final homeApiService =
    getIt.registerSingleton<HomeApiService>(HomeApiService(getIt<Dio>()));
final homeRemoteDataSource = getIt.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSource(homeApiService));
final homeRepository = getIt.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(homeRemoteDataSource));

//genre DI
final genreUseCase =
    getIt.registerSingleton<GenreListUseCase>(GenreListUseCase(homeRepository));
final genreCubit =
    getIt.registerSingleton<GenreCubit>(GenreCubit(genreUseCase));

//now playing DI
final nowPlayingUseCase = getIt
    .registerSingleton<NowPlayingUseCase>(NowPlayingUseCase(homeRepository));
final nowPlayingCubit = getIt.registerSingleton<NowPlayingMoviesCubit>(
    NowPlayingMoviesCubit(nowPlayingUseCase));

final homeUseCase =
    getIt.registerSingleton<HomeUseCase>(HomeUseCase(homeRepository));
final homeCubit = getIt.registerSingleton<HomeCubit>(HomeCubit(homeUseCase));
//popular movies DI
final popularMoviesUseCase = getIt.registerSingleton<PopularMoviesUseCase>(
    PopularMoviesUseCase(homeRepository));
final popularMoviesCubit = getIt.registerSingleton<PopularMoviesCubit>(
    PopularMoviesCubit(popularMoviesUseCase));
//top top rated DI
final topRatedUseCase = getIt.registerSingleton<TopRatedMoviesUseCase>(
    TopRatedMoviesUseCase(homeRepository));
final topRatedMoviesCubit = getIt.registerSingleton<TopRatedMoviesCubit>(
    TopRatedMoviesCubit(topRatedUseCase));

//up coming movie DI
final upcomingMoviesUseCase = getIt.registerSingleton<UpComingMoviesUseCase>(
    UpComingMoviesUseCase(homeRepository));
final upcomingMoviesCubit = getIt.registerSingleton<UpcomingMoviesCubit>(
    UpcomingMoviesCubit(upcomingMoviesUseCase));

//local
final homeDbService =
    getIt.registerSingleton<HiveHomeDbService>(HiveHomeDbService(MovieDao()));
final homeLocalDataSource = getIt
    .registerSingleton<HomeLocalDataSource>(HomeLocalDataSource(homeDbService));
