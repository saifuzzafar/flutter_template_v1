import 'package:flutter/material.dart';

abstract class BasePage<T extends BasePageState> extends StatefulWidget {
  const BasePage({super.key});

  @override
  T createState();
}

abstract class BasePageState extends State {}

abstract class BaseStatefulPage extends BasePageState {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get rootScaffoldKey => _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: scaffoldBackgroundColor(),
        appBar: buildAppbar(),
        extendBodyBehindAppBar: extendBodyBehindAppBar(),
        body: _buildScaffoldBody(context),
        drawer: buildDrawer(),
        floatingActionButton: floatingActionButton(),
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
        bottomNavigationBar: buildBottomNavigationBar(),
        bottomSheet: buildBottomSheet(),
      ),
    );
  }

  Widget? floatingActionButton() {
    return null;
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Building a appbar of screen
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  /// Building a drawer of screen
  Widget? buildDrawer() {
    return null;
  }

  /// Building a bottom-sheet
  Widget? buildBottomSheet() {
    return null;
  }

  /// Building a bottomNaviagtion Bar
  Widget? buildBottomNavigationBar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  Widget _buildScaffoldBody(BuildContext context) {
    return buildView(context);
  }

  @mustCallSuper
  Widget buildView(BuildContext context);

  bool drawerEnableOpenDragGesture() {
    return false;
  }
}
