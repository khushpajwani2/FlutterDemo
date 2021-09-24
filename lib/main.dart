// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/home.dart';
import 'package:flutterdemo/routes/routes.dart';
import 'package:flutterdemo/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _userName;
  Widget _screen;

  @override
  Widget build(BuildContext context) {
    // Declare Variables here...

    Future<void> getUserName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userName = prefs.getString('userName');
      setState(() {
        _userName = userName;
      });
      print("This is username:- $_userName");
    }

    if (_userName.toString() == null ||
        _userName.toString().isEmpty ||
        _userName.toString() == "Empty" ||
        _userName.toString() == "") {
      setState(() {
        _screen = const Login();
      });
    } else {
      setState(() {
        _screen = const Home();
      });
    }

    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: _screen,
      // home: const Login(),
    );
  }
}
