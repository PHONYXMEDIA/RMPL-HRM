import 'package:flutter/material.dart';

@immutable
class AlertDialogModel<T> {
  const AlertDialogModel({
    required this.title,
    required this.message,
    required this.buttons,
  });

  final String title;
  final String message;
  final Map<String, T> buttons;
}

extension Present<T> on AlertDialogModel<T> {
  Future<T?> present(BuildContext context) {
    return showDialog<T?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Text(message, textAlign: TextAlign.center),
          actions: buttons.entries.map(
            (button) {
              return TextButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    button.value,
                  );
                },
                child: Text(button.key),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
