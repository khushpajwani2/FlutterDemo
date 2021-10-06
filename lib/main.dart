// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/screens/home.dart';
import 'package:flutterdemo/routes/routes.dart';
import 'package:flutterdemo/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _userName;
Widget _screen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  _userName = prefs.getString('userName');
  print("This is username:-- $_userName");
  if (_userName == null ||
      _userName.isEmpty ||
      _userName == "Empty" ||
      _userName == "") {
    /*setState(() {
        _screen = const Login();
      });*/
    print("not logged in");
    _screen = const Login();
  } else {
/*      setState(() {
        _screen = const Home();
      });*/
    print("logged in");
    _screen = const Home();
    // Navigator.pushReplacementNamed(context, '/home');
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    initial();
    super.initState();
  }

  void initial() async {}

  @override
  Widget build(BuildContext context) {
    // Declare Variables here...
    print("This is username:-  $_userName");
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false, // 1
          systemOverlayStyle: SystemUiOverlayStyle.light, // 2
        ),
      ),
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: _screen,
      // home: const Login(),
    );
  }
}
