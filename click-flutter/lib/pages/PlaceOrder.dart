import 'package:counter_flutter/element/circluarloader_widget.dart';
import 'package:counter_flutter/model/buying_power.dart';
import 'package:counter_flutter/pages/CongratulationScreen.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class PlaceOrderScreen extends StatefulWidget {
  final placedata;
  PlaceOrderScreen(this.placedata);
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  var tapped = false, checkbox = false;
  bool monVal = false;
  String investAmount;
  BuyingPoData buydata;

  _submit() {}

  getBuyinPower() async {
    var buypowType = await Providers().getBuyingPower();
    if (buypowType.error == 0) {
      setState(() {
        buydata = buypowType.data;
      });
    } else if (buypowType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getBuyinPower();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: 30,
              color: Color(0xFF649f49),
            ),
          ),
          title: Column(
            children: <Widget>[
              Text(
                "Place Order",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              Text(
                "IPO details here",
                style: TextStyle(color: Colors.blueGrey, fontSize: 12),
              )
            ],
          ),
        ),
        body: (buydata == null)
            ? CircularLoadingWidget(
                height: 200,
              )
            : Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, bottom: 20),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Anticipated price:" +
                                new String.fromCharCodes(new Runes('\u0024')) +
                                "12050-12",
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                          Text(
                            "Shares offered:"
                            "100,000",
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                          Text(
                            "Ticket size:" +
                                new String.fromCharCodes(new Runes('\u0024')) +
                                widget.placedata['minticSize'].toString() +
                                new String.fromCharCodes(new Runes('\u0024')) +
                                widget.placedata['maxticSize'].toString(),
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ]),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 12, top: 25),
                        child: Text(
                          "Buying power: " +
                              new String.fromCharCodes(new Runes('\u0024')) +
                              buydata.buyingPower.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w700),
                        )),
                    Container(
                      padding: EdgeInsets.only(
                          left: 32, top: 13, bottom: 13, right: 32),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Investment Amount",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600)),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              String.fromCharCode(036),
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF649f49)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 40),
                              child: TextFormField(
                                onSaved: (value) {
                                  investAmount = value;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "1222",
                                    hintStyle: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF649f49),
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 32, right: 32, top: 13, bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Approximate Shares",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600)),
                          Text(widget.placedata['apprxShare'],
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                    tapped == false
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                tapped = true;
                              });
                            },
                            child: Container(
                                width: double.infinity,
                                height: 45,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Color(0xFF98cd4a),
                                        Color(0xFF649f49)
                                      ]),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text("Review Order",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20)))),
                          )
                        : Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "This order will be placed through your Trade station account.",
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "There is no assurance that your conditional offer to buy will receive full allocation at all. Your order is conditional on the final sare price being no greater than 20% above the high end of the price range.",
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.grey.shade300,
                                  thickness: 1,
                                ),
                                Row(
                                  children: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor:
                                              Color(0xFF649f49)),
                                      child: Checkbox(
                                        activeColor: Color(0xFF649f49),
                                        value: monVal,
                                        onChanged: (bool value) {
                                          setState(() {
                                            monVal = value;
                                            checkbox = !checkbox;
                                          });
                                        },
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            """I attest that I am not a "restricted person"\npersuant to""",
                                        style: TextStyle(color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Rule 5031 ',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color:
                                                      Colors.lightBlueAccent)),
                                          TextSpan(
                                              text: 'and ',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          TextSpan(
                                              text: 'Rule 5131',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color:
                                                      Colors.lightBlueAccent)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (checkbox == true) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CongratulationScreen()));
                                      }
                                    });
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      // var placesub = {
                                      //   "ext_id": widget.placedata['exid'],
                                      //   "mpid": "TRAD",
                                      //   "account_id": "varun2020",
                                      //   "requested_amount": investAmount,
                                      //   "buying_power": buydata.buyingPower,
                                      //   "attestation_to_rules_5130_and_5131":
                                      //       monVal,
                                      //   "dsp": widget.placedata['dsp']
                                      // };
                                      // print("fffgfgf $placesub");
                                      // _submit();
                                    },
                                    child: Container(
                                        decoration: checkbox == true
                                            ? BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                gradient: LinearGradient(
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    colors: [
                                                      Color(0xFF98cd4a),
                                                      Color(0xFF649f49)
                                                    ]))
                                            : BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.black38,
                                                      Colors.grey
                                                    ])),
                                        height: 50,
                                        width: double.infinity,
                                        // color: Colors.lime,
                                        child: Center(
                                            child: Text(
                                          "Submit Conditional Offer to Buy",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ))),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.grey.shade300,
                                  thickness: 1,
                                ),
                              ],
                            ))
                  ],
                ),
              ),
      ),
    );
  }
}
