import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';

/// This class [HomeRepositoryImpl] is the implementation of [HomeRepository]
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);
}
