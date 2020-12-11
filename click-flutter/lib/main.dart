import 'dart:ui';

import 'package:counter_flutter/pages/LoginScreen.dart';

import 'package:flutter/material.dart';

void main() => runApp(chooseWidget(window.defaultRouteName));

Widget chooseWidget(String route) {
  switch (route) {
    // name of the route defined in the host app
    case 'splashRoute':
      return MyFlutterActivity();
    // return OrderDetails();

    default:
      return Center(
        child: Text('Unknown'),
      );
  }
}

//void main() => runApp((MyFlutterActivity()));

class MyFlutterActivity extends StatefulWidget {
  @override
  _MyFlutterActivityState createState() => _MyFlutterActivityState();
}

class _MyFlutterActivityState extends State<MyFlutterActivity> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: OrderDetails(),
      home: LoginScreen(),
    );
  }
}
