import 'package:flutter/material.dart';

/// This class [HomePageTabView] which specifically used to render Web UI
class HomePageTabView extends StatelessWidget {
  const HomePageTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Tab view",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
