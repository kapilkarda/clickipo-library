import 'dart:ui';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:counter_flutter/pages/LoginScreen.dart';
import 'package:counter_flutter/pages/all_offering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'order_details.dart';
import 'pages/my_order.dart';

//void main() => runApp(chooseWidget(window.defaultRouteName));

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

void main() => runApp((MyFlutterActivity()));

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset("assets/images/1app-02.png",
        height: 70,
        width: 120,),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Color(0xFF8bc53f),
          ),
          Image.asset(
            "assets/images/3dot-removebg-preview.png",
            height: 20,
            width: 25,
            color: Color(0xFF8bc53f),
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new TabBar(
            unselectedLabelColor: Color(0xFF8bc53f),
            controller: _controller,
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
                indicatorRadius: 0,
                indicatorColor: Color(0xFF8bc53f),
                indicatorHeight: 45,
                tabBarIndicatorSize: TabBarIndicatorSize.label),
            tabs: [
              Container(
                child: new Tab(
                  //text: 'ALL OFFERINGS',
                  child: Text(
                    "ALL OFFERINGS",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              new Tab(
                child: Text(
                  "MY ORDERS",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          _tabBarVi()
        ],
      ),
    );
  }

  Widget _tabBarVi() {
    return new Expanded(
      child: new TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          AllOffering(),
         MyOrder(),
        ],
      ),
    );
  }
}

