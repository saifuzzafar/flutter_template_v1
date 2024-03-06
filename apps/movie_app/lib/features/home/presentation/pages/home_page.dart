import 'package:core_flutter/core/base_ui/base_page.dart';
import 'package:core_flutter/core/base_ui/device_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/di/app_provider.dart';
import 'package:movie_app/features/home/data/api_service/home_api_service.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:movie_app/features/home/di/home_providers.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/presentation/pages/home_page_mobile_view.dart';

/// This class [HomePage] which is UI screen which display interact with the user
class HomePage extends BasePage<HomePageState> {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

/// This class [HomePageState] which consume by HomePage as page state
class HomePageState extends BaseStatefulPage {
  @override
  void initState() {
    super.initState();
    nowPlayingCubit.fetchNowPlaying();
    genreCubit.fetchGenre();
    topRatedMoviesCubit.fetchTopRated();
    popularMoviesCubit.fetchPopularMovies();
    upcomingMoviesCubit.fetchUpcomingMovies();
  }

  @override
  Widget buildView(BuildContext context) {
    return DeviceDetectorWidget(
      webSiteView: () => const HomePageMobileView(
        viewPort: 0.3,
        key: Key("web"),
      ),
      phoneView: () => const HomePageMobileView(
        key: Key("mobile"),
      ),
      tabletView: () => const HomePageMobileView(
        viewPort: 0.3,
        key: Key("tablet"),
      ),
    );
  }

  @override
  void dispose() {
    getIt.unregister<HomeApiService>();
    getIt.unregister<HomeRemoteDataSource>();
    getIt.unregister<HomeRepository>();

    super.dispose();
  }
}
