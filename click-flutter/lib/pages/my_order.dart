import 'dart:convert';

import 'package:counter_flutter/element/circluarloader_widget.dart';
import 'package:counter_flutter/model/order_model.dart';
import 'package:counter_flutter/pages/ConfirmCancel.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'modifyScreen.dart';
import 'orderHistory.dart';
import 'order_details.dart';
import 'order_recogination.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  var tap = -1;
  List<OrderData> orderdata;

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade400,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.teal.shade400,
                    size: 16,
                  ),
                  Text(
                    " Swipe right to see order history.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.teal.shade400,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
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
                              "orderh": orderdata[index].orders,
                              "logo": orderdata[index].logoSmall
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
                                    if (orderdata[index].orders[0].status ==
                                        "active") {
                                      setState(() {
                                        tap == -1 ? tap = index : tap = -1;
                                      });
                                    } else {}
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: (orderdata[index].orders[0].status ==
                                            "active")
                                        ? Colors.white
                                        : Colors.grey.shade200,
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
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
                                                  fontSize: 17,
                                                  color:
                                                      Colors.blueGrey.shade600,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Order: ",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .blueGrey.shade400,
                                                      fontSize: 15,
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
                                                            "${String.fromCharCode(036)}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blueGrey
                                                                    .shade400),
                                                          ),
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
                                                                    .blueGrey
                                                                    .shade500,
                                                                fontSize: 15,
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
                                                                    .blueGrey
                                                                    .shade500,
                                                                fontSize: 15,
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
                                                        color: Colors
                                                            .blueGrey.shade400,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    (orderdata[index]
                                                                .orders[0]
                                                                .status ==
                                                            "active")
                                                        ? "Pending"
                                                        : orderdata[index]
                                                            .orders[0]
                                                            .status,
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blueGrey.shade400,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Date: ",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blueGrey.shade500,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Text(
                                                    orderdata[index]
                                                        .createdAt
                                                        .substring(0, 10),
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blueGrey.shade400,
                                                        fontSize: 15,
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
                                        color: Colors.blueGrey.shade300,
                                        height: 57,
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
                                                    color:
                                                        Colors.orange.shade800,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
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
                                              // onTap: () {
                                              //   var viewData = {
                                              //     "exid":
                                              //         orderdata[index].extId,
                                              //     "mintickersize":
                                              //         orderdata[index]
                                              //             .minTicketSize,
                                              //     "maxtickersize":
                                              //         orderdata[index]
                                              //             .maxTicketSize,
                                              //     "maxprice":
                                              //         orderdata[index].maxPrice,
                                              //     "minprice":
                                              //         orderdata[index].minPrice,
                                              //     "ioicutoff": orderdata[index]
                                              //         .ioiCutoffDatetime,
                                              //   };
                                              //   Navigator.push(
                                              //       context,
                                              //       MaterialPageRoute(
                                              //           builder: (context) =>
                                              //               OrderRecogination(
                                              //                   viewData)));
                                              // },

                                              onTap: () {
                                                var orderDetails = {
                                                  "logo_small": orderdata[index]
                                                      .logoSmall,
                                                  "orderDollarsh":
                                                      orderdata[index]
                                                          .ordrDollarShare,
                                                  "requestAmo": orderdata[index]
                                                      .orders[index]
                                                      .requestedAmount,
                                                  "requestShare":
                                                      orderdata[index]
                                                          .orders[0]
                                                          .requestedShares,
                                                  "tickerSy": orderdata[index]
                                                      .tickerSymbol,
                                                  "finalPrice": orderdata[index]
                                                      .finalShares,
                                                  "minPrice":
                                                      orderdata[index].minPrice,
                                                  "maxPrice":
                                                      orderdata[index].maxPrice,
                                                  "tradedate": orderdata[index]
                                                      .tradeDate,
                                                  "underwrite": orderdata[0]
                                                      .underwritersList,
                                                  "prosp": orderdata[index]
                                                      .prospectusUrl
                                                };
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OrderDetails(
                                                                orderDetails)));
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 6),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
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
                                                var modifyDetails = {
                                                  "exid":
                                                      orderdata[index].extId,
                                                  "logo_small": orderdata[index]
                                                      .logoSmall,
                                                  "minPrice":
                                                      orderdata[index].minPrice,
                                                  "maxPrice":
                                                      orderdata[index].maxPrice,
                                                  "ticminPrice":
                                                      orderdata[index]
                                                          .minTicketSize,
                                                  "ticmaxPrice":
                                                      orderdata[index]
                                                          .maxTicketSize,
                                                  "finalPrice": orderdata[index]
                                                      .finalShares,
                                                  "orderDollarsh":
                                                      orderdata[index]
                                                          .ordrDollarShare,
                                                  "buyingp": orderdata[index]
                                                      .orders[0]
                                                      .buyingPowerAsOf,
                                                  "requestAmo": orderdata[index]
                                                      .orders[index]
                                                      .requestedAmount,
                                                  "requestShare":
                                                      orderdata[index]
                                                          .orders[0]
                                                          .requestedShares,
                                                  "dsp": orderdata[index].dsp,
                                                  "account_id": orderdata[index]
                                                      .orders[0]
                                                      .brokerConnection
                                                      .accountId,
                                                  "mpid": orderdata[index]
                                                      .orders[0]
                                                      .brokerConnection
                                                      .mpid
                                                };
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ModifyOrder(
                                                                modifyDetails)));
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 6),
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF8bc53f),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
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
