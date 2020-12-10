import 'dart:convert';

import 'package:counter_flutter/element/circluarloader_widget.dart';
import 'package:counter_flutter/model/order_model.dart';
import 'package:counter_flutter/pages/ConfirmCancel.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'orderHistory.dart';
import 'order_recogination.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  var tap = -1;
  List<OrderData> orderdata;

  getModify(modiData) async {
    var morderType = await Providers().getModifyOrder(modiData);
    print(json.encode(morderType));
    if (morderType.error == 0) {
      setState(() {
        //orderdata = orderrecType.data;
      });
    } else if (morderType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

  getOfferingTyp() async {
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

  @override
  void initState() {
    super.initState();
    getOfferingTyp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade300,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info, color: Color(0xFF00ccff)),
                  Text(
                    "Swipe right to see order history.",
                    style: TextStyle(fontSize: 17, color: Color(0xFF00ccff)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          (orderdata == null)
              ? CircularLoadingWidget(
                  height: 200,
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: orderdata.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            var ordhData = {
                              "ordname": orderdata[index].name,
                              "orderdo":
                                  orderdata[index].ordrDollarShare.toString(),
                              "orderh": orderdata[index].orders
                            };
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderHostory(ordhData)));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 0.5, right: 0.5),
                            decoration: (tap == index)
                                ? BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2))
                                : BoxDecoration(),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      tap == -1 ? tap = index : tap = -1;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.grey.shade200,
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          color: Colors.white,
                                          child: Image.network(
                                              "https:${orderdata[index].logoSmall}"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              orderdata[index].name,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color:
                                                      Colors.blueGrey.shade700,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Order: ",
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Row(
                                                  children: [
                                                    (orderdata[index]
                                                                .ordrDollarShare
                                                                .toString() !=
                                                            "0")
                                                        ? Text("")
                                                        : Text(
                                                            "${String.fromCharCode(036)} "),
                                                    (orderdata[index]
                                                                .ordrDollarShare
                                                                .toString() !=
                                                            "0")
                                                        ? Text(
                                                            orderdata[index]
                                                                .orders[0]
                                                                .requestedShares
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))
                                                        : Text(
                                                            orderdata[index]
                                                                .orders[0]
                                                                .requestedAmount
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Status: ",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    orderdata[index]
                                                        .orders[0]
                                                        .status,
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Date: ",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    orderdata[index]
                                                        .createdAt
                                                        .substring(0, 10),
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                (tap == index)
                                    ? Container(
                                        color: Colors.grey.shade400,
                                        height: 65,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 14,
                                            right: 14,
                                            top: 10,
                                            bottom: 10),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                var ordname =
                                                    orderdata[index].name;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ConfirmCancel(
                                                                ordname)));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                width: (29 / 100) *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Cancel Order",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var viewData = {
                                                  "exid":
                                                      orderdata[index].extId,
                                                  "mintickersize":
                                                      orderdata[index]
                                                          .minTicketSize,
                                                  "maxtickersize":
                                                      orderdata[index]
                                                          .maxTicketSize,
                                                  "maxprice":
                                                      orderdata[index].maxPrice,
                                                  "minprice":
                                                      orderdata[index].minPrice,
                                                  "ioicutoff": orderdata[index]
                                                      .ioiCutoffDatetime,
                                                };
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OrderRecogination(
                                                                viewData)));
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 6),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                width: (29 / 100) *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "View Order",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var modiData = {
                                                  "ext_id": "123123432123",
                                                  "buying_power": 13802.0,
                                                  "mpid": "TRAD",
                                                  "account_id": "varun2020",
                                                  "attestation_to_rules_5130_and_5131":
                                                      1,
                                                  "dsp": 0,
                                                  "requested_amount": 1200.0
                                                };
                                                print(modiData);
                                                getModify(modiData);
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             OrderRecogination()));
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 6),
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF8bc53f),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                width: (29 / 100) *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Modify Order",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                Divider(
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
