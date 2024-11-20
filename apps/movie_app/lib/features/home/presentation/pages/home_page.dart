import 'package:auto_route/auto_route.dart';
import 'package:core_flutter/core/base_ui/base_page.dart';
import 'package:core_flutter/core/base_ui/device_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/di/home_providers.dart';
import 'package:movie_app/features/home/presentation/pages/home_page_mobile_view.dart';
import 'package:movie_app/features/home/presentation/pages/home_page_tab_view.dart';
import 'package:movie_app/features/home/presentation/pages/home_page_web_view.dart';

/// This class [HomePage] which is UI screen which display interact with the user
@RoutePage()
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
    HomeProviders.instance();
  }

  @override
  Widget buildView(BuildContext context) {
    return DeviceDetectorWidget(
      webSiteView: () => const HomePageWebView(),
      phoneView: () => const HomePageMobileView(),
      tabletView: () => const HomePageTabView(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
