import 'package:movie_app/features/home/data/data_source/local_data_source/local_data_source.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';

/// This class [HomeRepositoryImpl] is the implementation of [HomeRepository]
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource, this._homeLocalDataSource);
}
