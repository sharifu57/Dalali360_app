import 'package:flutter/material.dart';

void failedDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Icon(
          Icons.cancel,
          color: Colors.red,
          size: 48,
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
