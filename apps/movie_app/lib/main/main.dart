import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localizations/generated/l10n.dart';
import 'package:movie_app/constants/movie_app_constants.dart';
import 'package:movie_app/main/flavor.dart';
import 'package:movie_app/main/navigation/movie_app_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../di/app_provider.dart';

void mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppProviders().init(flavor);

  runApp(MovieApp(
    flavor: flavor,
  ));
}

class MovieApp extends StatelessWidget {
  final Flavor flavor;

  const MovieApp({
    super.key,
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MovieAppRouter(MovieAppConstants.navigatorKey).config(),
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            //various breakpoints for devices to interpret the responsive nature
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
      },
      debugShowCheckedModeBanner: false,
      title: flavor.appTitle,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
