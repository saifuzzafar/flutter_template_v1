import 'package:movie_app/features/home/data/db_service/db_service.dart';

/// This class [LocalDataSource] is used to store data in Either
/// [Hive] or [FlutterSecureStorage] based on use case
class HomeLocalDataSource {
  final HomeDbService homeDbService;

  HomeLocalDataSource(this.homeDbService);
}
