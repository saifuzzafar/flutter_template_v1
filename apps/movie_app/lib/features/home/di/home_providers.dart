
import 'package:movie_app/features/home/domain/use_case/home_use_case.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:movie_app/features/home/data/api_service/home_api_service.dart';
import 'package:movie_app/features/home/data/repository/home_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/di/app_provider.dart';

final homeApiService = getIt.registerSingleton<HomeApiService>(HomeApiService(getIt<Dio>()));
final homeRemoteDataSource = getIt.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSource(homeApiService));
final homeRepository = getIt.registerSingleton<HomeRepository>(HomeRepositoryImpl(homeRemoteDataSource));
final homeUseCase = getIt.registerSingleton<HomeUseCase>(HomeUseCase(homeRepository));
final homeCubit = getIt.registerSingleton<HomeCubit>(HomeCubit(homeUseCase));

