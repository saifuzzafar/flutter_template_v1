import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_app/main/navigation/route_path.dart';

class MovieRouter {
  static GoRouter setupRouter() {
    return GoRouter(
      initialLocation: RoutePaths.home,
      // Define your routes here
      routes: [
        // Home route
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) => const HomePage(),
        ),
        // About route

        // Add more routes as needed
      ],
    );
  }
}
