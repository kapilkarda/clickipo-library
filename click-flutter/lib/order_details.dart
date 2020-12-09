import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
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
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => OrderRecogination()));
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
        padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: ListView(
          children: <Widget>[
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Your Conditional \nPurchase Order",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Text("Approximate \nShare",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("1,020",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                  Text("= 102",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Symbol",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10,
            ),
            Text("WLMT",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
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
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text("100,000,000 shares",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
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
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
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
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text("Sep 30",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
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
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text("ABEL/NOSER CORP.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
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
                Text("Read the prospectus",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500))
              ],
            )
          ],
        ),
      ),
    );
  }
}
