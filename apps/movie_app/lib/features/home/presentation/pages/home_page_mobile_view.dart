import 'package:flutter/material.dart';

/// This class [HomePageMobileView] which specifically used to render Mobile UI
class HomePageMobileView extends StatelessWidget {
  const HomePageMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Mobile view",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
