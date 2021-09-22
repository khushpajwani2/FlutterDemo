import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/home.dart';
import 'package:flutterdemo/screens/login.dart';

var routes = <String, WidgetBuilder>{
  '/home': (context) => const Home(),
  '/login': (context) => const Login(),
};
