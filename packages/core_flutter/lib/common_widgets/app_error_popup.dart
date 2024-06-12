import 'package:flutter/material.dart';

class AppErrorPopup extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onDismissed;

  const AppErrorPopup(
      {super.key, required this.errorMessage, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: Text(errorMessage),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (onDismissed != null) {
              onDismissed!();
            } else {}
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
