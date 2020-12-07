import 'package:flutter/material.dart';

import 'all_offering.dart';

class OfferingDetails extends StatefulWidget {
  @override
  _OfferingDetailsState createState() => _OfferingDetailsState();
}

class _OfferingDetailsState extends State<OfferingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF649f49),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Engineer Master Solution Pvt Ltd \nMSFT",
          style: TextStyle(color: Color(0xFF002b47), fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "IPO",
                  style: TextStyle(color: Color(0xFF8bc53f), fontSize: 19),
                ),
                Text(
                  "Financial",
                  style: TextStyle(color: Color(0xFF8bc53f), fontSize: 19),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Date:",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 19),
                ),
                Text(
                  "TBD",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 19),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Price range:",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 19),
                ),
                Text(
                  "TBD",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 19),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Approx shares:",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 19),
                ),
                Text(
                  "TBD",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 19),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AllOfferingS()));
              },
              child: Container(
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
                      ]
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Not available at this time",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: (42 / 100) * MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xFF649f49), width: 1.5)),
                  alignment: Alignment.center,
                  child: Text(
                    "Share",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8bc53f)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: (42 / 100) * MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xFF649f49), width: 1.5)),
                  alignment: Alignment.center,
                  child: Text(
                    "Interested?",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8bc53f)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "DESCRIPTION",
                  style: TextStyle(
                      color: Color(0xFF002b47),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text("adfasd saf asf",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 17,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.edit,
                  size: 15,
                ),
                Text("Prospectus",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 17,
                        fontWeight: FontWeight.w500))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "UNDERWRITER(S)",
                  style: TextStyle(
                      color: Color(0xFF002b47),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text("ABEL/NOSER CORP.-ABN AMRO SECURITIES \n(USA)LLC",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 17,
                          fontWeight: FontWeight.w400)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
