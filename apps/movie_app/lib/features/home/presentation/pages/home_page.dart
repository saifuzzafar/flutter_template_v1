import 'package:auto_route/auto_route.dart';
import 'package:core_flutter/core/base_ui/base_page.dart';
import 'package:core_flutter/core/base_ui/device_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/di/home_providers.dart';
import 'package:movie_app/features/home/presentation/cubit/genere_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/now_playing_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/popular_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/up_coming_cubit.dart';
import 'package:movie_app/features/home/presentation/pages/home_page_mobile_view.dart';

/// This class [HomePage] which is UI screen which display interact with the user
@RoutePage()
class HomePage extends BasePage<HomePageState> {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

/// This class [HomePageState] which consume by HomePage as page state
class HomePageState extends BaseStatefulPage {
  late HomeProviders homeProviders;

  @override
  void initState() {
    super.initState();

    homeProviders = HomeProviders.instance();
  }

  @override
  Widget buildView(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return context.read<NowPlayingMoviesCubit?>() ??
                NowPlayingMoviesCubit(homeProviders.nowPlayingUseCase);
          },
        ),
        BlocProvider(
          create: (context) {
            return context.read<GenreCubit?>() ??
                GenreCubit(homeProviders.genreListUseCase);
          },
        ),
        BlocProvider(
          create: (context) {
            return context.read<TopRatedMoviesCubit?>() ??
                TopRatedMoviesCubit(homeProviders.topRatedMoviesUseCase);
          },
        ),
        BlocProvider(
          create: (context) {
            return context.read<PopularMoviesCubit?>() ??
                PopularMoviesCubit(homeProviders.popularMoviesUseCase);
          },
        ),
        BlocProvider(
          create: (context) {
            return context.read<UpcomingMoviesCubit?>() ??
                UpcomingMoviesCubit(homeProviders.upComingMoviesUseCase);
          },
        ),
      ],
      child: DeviceDetectorWidget(
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
