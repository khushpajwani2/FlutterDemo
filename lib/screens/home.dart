import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterdemo/components/circleimage.dart';
import 'package:flutterdemo/components/logoutDialog.dart' as logout_dialog;
import 'package:flutterdemo/models/albummodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Declare Variables here...
/*    Map data = {};
    data = ModalRoute.of(context)?.settings.arguments as Map;*/
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    // icon: const Icon(Icons.arrow_back, color: Colors.white),
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer()),
            // onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
          // title: const Text("Sample"),
          title: const Text("DashBoard"),
          titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              wordSpacing: 10,
              shadows: [
                Shadow(
                  color: Color(0x000073ff),
                  blurRadius: 4,
                  offset: Offset(4, 8),
                )
              ]),
          // centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Flutter Demo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        circleImage('assets/image/desktop.png'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Profile'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Logout'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        logout_dialog.logoutDialog(
                            context: context, screen: '/login');
                        // Navigator.pushReplacementNamed(context, '/login');
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: const Data());
  }
}

class Data extends StatefulWidget {
  const Data({
    Key? key,
    // this.color = const Color(0xFFFFE306),
    // this.child,
  }) : super(key: key);

  // final Color color;
  // final Widget? child;

  @override
  State<Data> createState() => DataState();
}

class DataState extends State<Data> {
  late Future<Album> futureAlbum;
  int _size = 0;
  late SharedPreferences logindata;
  String username = "";


  late Future<Album?> getToken;

  @override
  void initState() {
    // TODO: implement initState
    initial();
    getToken = performUserLogin("eve.holt@reqres.in", "cityslicka");
    // futureAlbum = fetchAlbum();
    super.initState();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('userName');
    });
  }

  void grow() {
    setState(() {
      _size += 1;
    });
  }

  void decrement() {
    setState(() {
      if (_size == 0) {
        Toast.show("This is the lowest value", context);
/*        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text("New Notification"),
        ));*/
        print("*******************");
      } else {
        _size -= 1;
      }
    });
  }

  void clearValue() {
    setState(() {
      _size = 0;
    });
  }

  static Future<Album?> performUserLogin(String email, String password) async {
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, String> JsonBody = {'email': email, 'password': password};
      print("The JSON Object is here $JsonBody");
      // make POST request
      final response = await http.post(Uri.parse('https://reqres.in/api/login'),
          body: JsonBody);
      // check the status code for the result
      int statusCode = response.statusCode;
      print("Login calling $response $statusCode");
      if (statusCode == 200) {
        print("********This is the 200 response*******");
        final responseJson = jsonDecode(response.body);
        print("hellllo" + Album.fromJson(responseJson).token);
        return Album.fromJson(responseJson);
      } else {
        throw Exception("Error in login");
        return null;
        //return UserModel();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context)?.settings.arguments as Map;
    // print("lakdsk $username");

    return Container(
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.black),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1.0,
              spreadRadius: 1.0,
              offset: Offset(10, 10),
              color: Color(0x61FF0000),
            )
          ]),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Hi, $username !! :- $_size",
            style: const TextStyle(fontSize: 20, shadows: [
              Shadow(
                color: Color(0x61FF0000),
                offset: Offset(5, 5),
                blurRadius: 1.0,
              )
            ]),
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 35,
            color: const Color(0xFF801E48),
            onPressed: () {
              print("********* $_size **********");
              grow();
            },
            child: const Text("Increment",
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 35,
            color: const Color(0xFF801E48),
            onPressed: () {
              // Onclick Navigation Handler
              /*Navigator.pushReplacementNamed(context, '/login', arguments: {
                'title':'This is title',
                'message':'This is message',
              });*/
              decrement();
              print("********* $_size **********");
            },
            child: const Text("Decrement",
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 35,
            color: const Color(0xFF801E48),
            onPressed: () {
              FutureBuilder<Album?>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("helllooo" + snapshot.connectionState.toString());
                    // return const CircularProgressIndicator();
                    // return Text(snapshot.data!.token);
                    return SnackBar(content: Text(snapshot.data!.token));
                  } else {
                    print('This is error ${snapshot.error}');
                    // return const CircularProgressIndicator();
                    return Text('${snapshot.error}');
                  }
                },
                future: getToken,
              );
              clearValue();
              print("********c* $_size **********");
            },
            child: const Text("Clear",
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
