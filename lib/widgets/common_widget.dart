import 'package:flutter/material.dart';

Future<void> showAlertDialog(context, String title, String message) async {
  return showDialog<void>(
    context: context,
    // barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () => Navigator.of(context).pop());

      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(message),
            ],
          ),
        ),
        // actions: <Widget>[
        //   TextButton(
        //     child: const Text('Approve'),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      );
    },
  );
}
