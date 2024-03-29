import 'package:movie_app/features/home/data/db_service/hive_db_service.dart';

/// This class [LocalDataSource] is used to store data in Either
/// [Hive] or [FlutterSecureStorage] based on use case
class HomeLocalDataSource {
  final HiveHomeDbService homeDbService;

  HomeLocalDataSource(this.homeDbService);
}
