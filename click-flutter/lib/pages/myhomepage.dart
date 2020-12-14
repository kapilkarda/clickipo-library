import 'dart:convert';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:counter_flutter/model/user_model.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';
import 'all_offering.dart';
import 'my_order.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  UserData userdata;

  getUserType() async {
    var userType = await Providers().getUser();
    if (userType.error == 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        userdata = userType.data;
        // prefs.setString('mpid', userdata.brokerConnection.mpid);
        // prefs.setString('account_id', userdata.brokerConnection.accountId);
      });
    } else if (userType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
    getUserType();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "assets/images/1app-02.png",
          height: 60,
          width: 100,
        ),
      ),
      body: new Column(
        children: <Widget>[
          Container(
            height: 35,
            child: new TabBar(
              unselectedLabelColor: Color(0xFF8bc53f),
              controller: _controller,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BubbleTabIndicator(
                indicatorRadius: 0,
                indicatorColor: Color(0xFF8bc53f),
                indicatorHeight: 35,
                tabBarIndicatorSize: TabBarIndicatorSize.label,
              ),
              tabs: [
                Container(
                  height: 20,
                  child: new Tab(
                    //text: 'ALL OFFERINGS',
                    child: Text(
                      "ALL OFFERINGS",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                new Tab(
                  child: Text(
                    "MY ORDERS",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
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
