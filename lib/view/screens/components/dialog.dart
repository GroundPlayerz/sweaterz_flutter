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
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(children: [
          Row(children: [
            CircularProgressIndicator(),
            Text(" Compressing now. ")
          ]),
          SizedBox(
            height: 5.0,
          ),
          Text("Uploading can take few seconds to minutes \n "
              "depending on file size after this dialog pops."),
        ]),
      ],
    ),
  );
}
