import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'orderPros.dart';

class OrderDetails extends StatefulWidget {
  final orderDetails;
  OrderDetails(this.orderDetails);
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF649f49),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Order details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  "https:${widget.orderDetails['logo_small']}",
                  height: 150,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Your Conditional \nPurchase Order",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text("Approximate \nShare",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        (widget.orderDetails['orderDollarsh'].toString() != "0")
                            ? Text("")
                            : Text(
                                "${String.fromCharCode(036)}",
                                style: TextStyle(
                                    color: Colors.blueGrey.shade600,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                        Text("${widget.orderDetails['requestAmo']}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Text("= ${widget.orderDetails['requestShare']}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text("Symbol",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Text("${widget.orderDetails['tickerSy']}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey.shade400,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Anticipated number of shares",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("${widget.orderDetails['finalPrice']} shares",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey.shade400,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Anticipated price range",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      new String.fromCharCodes(new Runes('\u0024')) +
                          '${widget.orderDetails['minPrice']}' +
                          '-' +
                          new String.fromCharCodes(new Runes('\u0024')) +
                          '${widget.orderDetails['maxPrice']}',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey.shade400,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Anticipated date",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      DateFormat("MMM d").format(DateTime.parse(
                          "${widget.orderDetails['tradedate']}")),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey.shade400,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Underwriting group",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey.shade700,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("ABEL/NOSER CORP.",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey.shade400,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.black26,
                    thickness: 1,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.attach_file,
                    size: 18,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Prospectus'),
                              content: Text(
                                  'Would you like to read the prospectus?'),
                              actions: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    var prourl = widget.orderDetails['prosp'];
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProspectusWeb(prourl)));
                                  },
                                  child: Text("Read",
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 15)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          color: Colors.teal, fontSize: 15)),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Read the prospectus",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey.shade300,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
