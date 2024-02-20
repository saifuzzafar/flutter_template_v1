import 'package:core_flutter/core/base_ui/base_page.dart';
import 'package:core_flutter/core/base_ui/device_detector_widget.dart';
import 'package:movie_app/features/home/presentation/pages/home_page_mobile_view.dart';
import 'package:movie_app/features/home/presentation/pages/home_page_web_view.dart';
import 'package:movie_app/features/home/domain/use_case/home_use_case.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:movie_app/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:movie_app/features/home/data/api_service/home_api_service.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/di/app_provider.dart';

/// This class [HomePage] which is UI screen which display interact with the user
class HomePage extends BasePage<HomePageState> {

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

/// This class [HomePageState] which consume by HomePage as page state
class HomePageState extends BaseStatefulPage {
  @override
  Widget buildView(BuildContext context) {
    return DeviceDetectorWidget(
      webSiteView: () => const HomePageWebView(),
      phoneView: () => const HomePageMobileView(),
    );
  }

  @override
  void dispose() {
    getIt.unregister<HomeApiService>();
    getIt.unregister<HomeRemoteDataSource>();
    getIt.unregister<HomeRepository>();
    getIt.unregister<HomeUseCase>();
    getIt.unregister<HomeCubit>();
    super.dispose();
  }
}
