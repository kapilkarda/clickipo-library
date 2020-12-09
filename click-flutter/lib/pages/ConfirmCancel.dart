import 'dart:convert';

import 'package:counter_flutter/element/circluarloader_widget.dart';
import 'package:counter_flutter/model/order_model.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'LoginScreen.dart';

class ConfirmCancel extends StatefulWidget {
  final ordname;
  ConfirmCancel(this.ordname);
  @override
  _ConfirmCancelState createState() => _ConfirmCancelState();
}

class _ConfirmCancelState extends State<ConfirmCancel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<OrderData> orderdata;
  List<OrderData> order1, order2;
  getOfferingTyp() async {
    print("hhjjkk");
    var orderType = await Providers().getOrderList();
    if (orderType.error == 0) {
      setState(() {
        orderdata = orderType.data;
      });
    } else if (orderType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

  List accountId;

  orderDet() {
    print("hjshjhjhjh hss ${orderdata.length}");

    for (int i = 0; i < orderdata.length; i++) {
      if (orderdata[i].name == widget.ordname) {
        print("dbdbh $i");
        setState(() {});
        // for (int j = 0; j < orderdata[i].orders.length; j++) {
        //   print("dbdbhuuuu $j");
        //   accountId.add(order[i].orders[j].brokerConnection.accountId);
        // }
      }
    }
  }

  getOrderDelete() async {
    var offeringType = await Providers().getDeletetOrder();
    if (offeringType.error == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else if (offeringType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else if (offeringType.error == 4004) {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text(offeringType.message)));
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getOfferingTyp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF649f49),
          ),
        ),
        title: Image.asset(
          "assets/images/1app-02.png",
          height: 70,
          width: 120,
        ),
      ),
      body: (orderdata == null)
          ? CircularLoadingWidget(
              height: 200,
            )
          : Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      "Are you sure?",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Text(
                        "Cancelling your order for \n${String.fromCharCode(036)}12,000 of AAAJJ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  GestureDetector(
                    onTap: () {
                      print("hjshjhjhjh hss");
                      orderDet();
                      //getOrderDelete();
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 24, left: 20, right: 20),
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                //Color(0xFF8bc53f),
                                Color(0xFF98cd4a),
                                Color(0xFF649f49)
                              ]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        // color: Colors.lime,
                        child: Center(
                            child: Text("I'm sure, Cancel offer",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 24, left: 20, right: 20),
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                //Color(0xFF8bc53f),
                                Color(0xFF98cd4a),
                                Color(0xFF649f49)
                              ]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        // color: Colors.lime,
                        child: Center(
                            child: Text("Don't cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)))),
                  )
                ],
              ),
            ),
    ));
  }
}
