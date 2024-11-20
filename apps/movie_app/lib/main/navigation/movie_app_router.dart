import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/main/navigation/route_path.dart';

import 'movie_app_router.gr.dart';

@AutoRouterConfig()
class MovieAppRouter extends $MovieAppRouter {
  final GlobalKey<NavigatorState> navigationKey;

  MovieAppRouter(this.navigationKey) : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: RoutePaths.home, page: HomeRoute.page, initial: true),
      ];
}
