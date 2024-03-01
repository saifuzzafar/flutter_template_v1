import 'package:flutter/material.dart';

/// Base class for creating pages in a Flutter application.
///
/// Subclasses should extend [BasePageState] and provide their own state class
/// by specifying the type parameter `T`.
///
/// Provides common page features such as scaffold setup, app bar, drawer,
/// bottom navigation bar, etc.

abstract class BasePage<T extends BasePageState> extends StatefulWidget {
  const BasePage({super.key});

  @override
  T createState();
}

/// Abstract base class for the state of pages in a Flutter application.
abstract class BasePageState extends State {}

/// Abstract base class extending [BasePageState] with additional functionality.
///
/// Subclasses of [BaseStatefulPage] automatically include a [GlobalKey] for
/// the scaffold state, scaffold setup, app bar, drawer, bottom navigation bar,
/// and other common UI components.
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
