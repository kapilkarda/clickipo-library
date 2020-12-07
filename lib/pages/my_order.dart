import 'package:flutter/material.dart';

import '../order_details.dart';
import 'order_recogination.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  var tap = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 0.5, right: 0.5),
                    decoration: (tap == index)
                        ? BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2))
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
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.white,
                                  child: Icon(Icons.ac_unit),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ems testing",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF002b47),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Order: ",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                            new String.fromCharCodes(
                                                new Runes('\u0024')) +
                                                '8,000',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Status: ",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400)),
                                        Text('Cancelled',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Date: ",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400)),
                                        Text("Nov 03,2020 7:33:40 ET",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400))
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
                              left: 14, right: 14, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                width: (29 / 100) *
                                    MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: Text(
                                  "Cancel Order",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => OrderDetails()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 6),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                  width: (29 / 100) *
                                      MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "View Order",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => OrderRecogination()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 6),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF8bc53f),
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                  width: (29 / 100) *
                                      MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Modify Order",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
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
                  );
                }),
          ),
        ],
      ),
    );
  }
}
