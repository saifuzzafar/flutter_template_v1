import 'package:flutter/material.dart';

/// This class [HomePageWebView] which specifically used to render Web UI
class HomePageWebView extends StatelessWidget {
  const HomePageWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Web view",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
