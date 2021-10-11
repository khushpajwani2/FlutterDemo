// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/routes/routes.dart';
import 'package:flutterdemo/screens/home.dart';
import 'package:flutterdemo/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'components/circleimage.dart';

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
    _screen = const Login();
  } else {
    _screen = const Home();
  }
  runApp(MyApp());
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
      home: SplashScreen(
        seconds: 4,
        navigateAfterSeconds: AfterSplash(),
        title: Text(
          'Welcome To Flutter Demo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        // image: Image.network(
        //     'https://flutter.io/images/catalog-widget-placeholder.png'),
        image: Image.asset('assets/image/splashdesktop.png'),
        photoSize: 100,
        backgroundColor: Colors.white,
        loaderColor: Colors.red,
        loadingText: Text("HIIIIIIII"),
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
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
    );
  }
}
