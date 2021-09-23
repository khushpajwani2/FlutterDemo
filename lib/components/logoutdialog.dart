import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

Future<void> logoutDialog({required BuildContext context, required String screen}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, screen);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}