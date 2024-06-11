import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/features/home/data/db_service/dao/movies_dao.dart';
import 'package:movie_app/features/home/data/entity/local_entity/movie_box_entity.dart';
import 'package:path_provider/path_provider.dart';

/// Singleton class for managing database connections related to home data.
///
/// This class follows the Singleton design pattern, ensuring that only one
/// instance of [HiveHomeDbService] exists throughout the application.

class HiveHomeDbService {
  /// Private static instance variable to hold the single instance of [HiveHomeDbService].
  ///
  /// This variable is initialized with an instance of [HiveHomeDbService] created
  /// using the `_internal()` constructor.
  static final HiveHomeDbService connect = HiveHomeDbService._internal();

  /// Private constructor for [HiveHomeDbService].
  ///
  /// This constructor is marked as private to prevent direct instantiation
  /// of [HiveHomeDbService] instances from outside the class.
  HiveHomeDbService._internal();

  static bool _isHiveInitialised = false;
  static MovieDao? _movieDao; // Data Access Object

  factory HiveHomeDbService(
    MovieDao movieDao,
  ) {
    return connect;
  }

  Future<void> ensureHiveInitialise() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    var path = "/asset/db";
    if (!kIsWeb) {
      Directory directory = await getApplicationDocumentsDirectory();
      path = directory.path;
    }

    if (!_isHiveInitialised) {
      if (!kIsWeb) {
        Hive.init(path);
      }
      Hive.registerAdapter(MovieBoxEntityAdapter());
      _isHiveInitialised = true;
      _movieDao = movieDao;
    }
  }

  MovieDao get movieDao => _movieDao ?? MovieDao();
}
