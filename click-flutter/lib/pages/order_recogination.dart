import 'package:flutter/material.dart';

import 'offering_details.dart';

class OrderRecogination extends StatefulWidget {
  @override
  _OrderRecoginationState createState() => _OrderRecoginationState();
}

class _OrderRecoginationState extends State<OrderRecogination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "10.00 - " +
                      new String.fromCharCodes(new Runes('\u0024')) +
                      '10,000.00',
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
                      '8.00' +
                      '-' +
                      new String.fromCharCodes(new Runes('\u0024')) +
                      '10.00',
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
              Container(
                height: 45,
                width: (43 / 100) * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade300),
                alignment: Alignment.center,
                child: Text("Reconfirm",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )
            ],
          )
        ]),
      ),
    );
  }
}
