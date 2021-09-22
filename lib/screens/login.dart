import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterdemo/main.dart';
import 'package:toast/toast.dart';

// void main() => runApp(const Login());

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  String title = "Empty";
  String message = "Empty";
  final alphanumeric = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validate() {
    if (userNameController.text.trim().isNotEmpty &&
        userNameController.text.trim() != "" &&
        passwordController.text.trim().isNotEmpty &&
        passwordController.text.trim() != "" &&
        alphanumeric.hasMatch(userNameController.text.trim())) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        // 'title': 'This is title',
        'title': title,
        'message': message,
      });
    } else {
      Toast.show("Please Fill the Details", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: userNameController,
                onChanged: (value) => title = value,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    labelText: 'Enter your username'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  onChanged: (value) => message = value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      labelText: 'Enter your Password'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/home');
                  validate();
                  FocusManager.instance.primaryFocus?.unfocus();
                  // Navigator.pop(context);
                },
                child: const Text('Login'),
              ),
            ]),
      ),
    );
  }
}
