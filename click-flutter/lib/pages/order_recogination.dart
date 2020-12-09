import 'dart:convert';

import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class OrderRecogination extends StatefulWidget {
  final viewData;
  OrderRecogination(this.viewData);
  @override
  _OrderRecoginationState createState() => _OrderRecoginationState();
}

class _OrderRecoginationState extends State<OrderRecogination> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  getOrderReconfirm(ordRedata) async {
    var orderrecType = await Providers().getorderReco(ordRedata);
    if (orderrecType.error == 0) {
      setState(() {
        //orderdata = orderrecType.data;
      });
    } else if (orderrecType.error == 3001) {
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text(orderrecType.errorConfig)));
    } else if (orderrecType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Order Reconifimation",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: ListView(children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Icon(
            Icons.ac_unit,
            size: 55,
            color: Colors.grey,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Ticket Size: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                  new String.fromCharCodes(new Runes('\u0024')) +
                      widget.viewData['mintickersize'].toString() +
                      '-' +
                      new String.fromCharCodes(new Runes('\u0024')) +
                      widget.viewData['maxtickersize'].toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Anticipated",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text("IPO Shares \nOffered",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: <Widget>[
              Text(
                  new String.fromCharCodes(new Runes('\u0024')) +
                      widget.viewData['minprice'].toString() +
                      '-' +
                      new String.fromCharCodes(new Runes('\u0024')) +
                      widget.viewData['maxprice'].toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.only(left: 85),
                child: Text("100000000",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Please ",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
              TextSpan(
                  text: "Indication of Interest ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500)),
              TextSpan(
                  text:
                      "your order below. You may keep the same amount,modify,or cancel your order. ",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Investment \nAmount",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      new String.fromCharCodes(new Runes('\u0024')) + "1020",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Approximate \nShares",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "= 102",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Buying Power: ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              Text(new String.fromCharCodes(new Runes('\u0024')) + "12782",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "There is no assurance that your conditional offer to buy will receive the full "
            "requested allocation or any allocation at all. Your order is conditional on the final "
            "share price being no greater than 20% higher or lower than the anticipated price range. "
            "Your order will be for the dollar amount calculated ragardless of the final share price.",
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => OfferingDetails()));
                },
                child: Container(
                  height: 45,
                  width: (43 / 100) * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green.shade100),
                  alignment: Alignment.center,
                  child: Text(
                    "Modify",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  var ordRedata = {
                    "ioi_reconfirm": widget.viewData['ioicutoff'] == null
                        ? 'reconfirm'
                        : 'ioi',
                    "mpid": "MPID",
                    "buying_power": 121212,
                    "account_id": "varun2020",
                    "ext_id": widget.viewData['exid']
                  };
                  print("jdhjh $ordRedata");
                  getOrderReconfirm(ordRedata);
                },
                child: Container(
                  height: 45,
                  width: (43 / 100) * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green.shade300),
                  alignment: Alignment.center,
                  child: Text("Reconfirm",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
