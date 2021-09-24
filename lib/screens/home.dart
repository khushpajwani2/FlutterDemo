import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdemo/components/backgroundimage.dart';
import 'package:flutterdemo/components/logoutDialog.dart' as logout_dialog;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Declare Variables here...
    var scaffoldState = GlobalKey<ScaffoldState>();
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
                          'Drawer Header',
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
  int _size = 0;

  void grow() {
    setState(() {
      _size += 1;
    });
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('userName');
    return username;
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

  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context)?.settings.arguments as Map;

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
            "Hi, " + getUsername().toString() + "!! :- $_size",
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
              clearValue();
              print("********* $_size **********");
            },
            child: const Text("Clear",
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
