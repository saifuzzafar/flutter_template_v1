import 'package:flutter/material.dart';
import 'package:movie_app/di/app_provider.dart';
import 'package:movie_app/features/home/data/api_service/home_api_service.dart';
import 'package:movie_app/features/home/data/data_source/local_data_source/local_data_source.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:movie_app/features/home/data/repository/home_repository_impl.dart';
import 'package:movie_app/features/home/domain/use_case/home_use_case.dart';
import 'package:movie_app/features/home/presentation/cubit/home_cubit.dart';
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
  late HomeUseCase homeUseCase;
  late HomeCubit homeCubit;

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
    homeUseCase = HomeUseCase(homeRepositoryImpl);
    homeCubit = HomeCubit(homeUseCase);
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
