import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/home.dart';
import 'package:flutterdemo/routes/routes.dart';
import 'package:flutterdemo/screens/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Declare Variables here...

    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const Login(),
      // home: ,
    );
  }
}