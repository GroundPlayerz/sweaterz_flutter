import 'package:flutter/material.dart';

Widget uploadScreeNextButtonAlertDialog(BuildContext context) {
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

Widget uploadingDialog() {
  return Dialog(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        Text("Uploading can take few seconds to minutes \n "
            "depending on file size after this dialog pops."),
      ],
    ),
  );
}
