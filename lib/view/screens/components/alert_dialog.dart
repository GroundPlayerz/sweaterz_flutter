import 'package:flutter/material.dart';

Widget uploadAlertDialog(BuildContext context) {
  return AlertDialog(
    title: Text('Empty value exists!'),
    content: Text('Each content must have at least one content.'),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'))
    ],
  );
}
