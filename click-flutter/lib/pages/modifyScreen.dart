import 'dart:convert';

import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'CongratulationScreen.dart';
import 'LoginScreen.dart';
import 'modi_rule1.dart';

class ModifyOrder extends StatefulWidget {
  final modifyDetails;
  ModifyOrder(this.modifyDetails);
  @override
  _ModifyOrderState createState() => _ModifyOrderState();
}

class _ModifyOrderState extends State<ModifyOrder> {
  var investController = new TextEditingController();
  bool monVal = false;
  bool subVal = false;
  var checkbox = false;
  var checkbox1 = false;
  var tapped = false;
  var invest, addinvest;
  String investment;

  getModify(modiData) async {
    var morderType = await Providers().getModifyOrder(modiData);
    if (morderType.error == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CongratulationScreen()));
    } else if (morderType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

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
        title: Image.asset(
          "assets/images/1app-02.png",
          height: 60,
          width: 100,
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
                  "https:${widget.modifyDetails['logo_small']}",
                  height: 150,
                  width: 100,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ticket Size:",
                      style: TextStyle(
                          color: Colors.blueGrey.shade400, fontSize: 15)),
                  Text(
                    "${String.fromCharCode(036)}" +
                        "${widget.modifyDetails['ticminPrice']}" +
                        " - " +
                        "${String.fromCharCode(036)}" +
                        "${widget.modifyDetails['ticmaxPrice']}",
                    style: TextStyle(
                        color: Colors.blueGrey.shade400, fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Anticipated ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Text("Shares",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Row(
                          children: [
                            (widget.modifyDetails['orderDollarsh'].toString() !=
                                    "0")
                                ? Text("")
                                : Text(
                                    "${String.fromCharCode(036)}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                  ),
                            Text("${widget.modifyDetails['minPrice']} - ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                          ],
                        ),
                        Row(
                          children: [
                            (widget.modifyDetails['orderDollarsh'].toString() !=
                                    "0")
                                ? Text("")
                                : Text(
                                    "${String.fromCharCode(036)}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                  ),
                            Text("${widget.modifyDetails['maxPrice']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Text("${widget.modifyDetails['finalPrice']}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Investment ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Text("Approx Shares",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: [
                        (widget.modifyDetails['orderDollarsh'].toString() !=
                                "0")
                            ? Text("")
                            : Text(
                                "${String.fromCharCode(036)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 20),
                              ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextFormField(
                              initialValue: "1200",
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              onChanged: (text) {
                                addinvest = text;
                                invest = int.parse(text) /
                                    widget.modifyDetails['maxPrice'];
                                setState(() {});
                              },
                              onSaved: (value) {
                                investment = value;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(" =${invest.toString().split(".")[0]}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: Text(
                "Buying Power: ${String.fromCharCode(036)}" +
                    "${widget.modifyDetails['buyingp']}",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey.shade600),
              )),
              Row(
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(unselectedWidgetColor: Color(0xff98cd4a)),
                    child: Checkbox(
                      activeColor: Color(0xff98cd4a),
                      value: monVal,
                      onChanged: (bool value) {
                        setState(() {
                          monVal = value;
                          checkbox = !checkbox;
                        });
                      },
                    ),
                  ),
                  Text("Make as new default amount",
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                ],
              ),
              tapped == false
                  ? GestureDetector(
                      onTap: () {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        if (int.parse(addinvest) >= 100) {
                          setState(() {
                            tapped = true;
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Minimum Investment Amount is "
                                  "${String.fromCharCode(036)}"
                                  "100.0",
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Container(
                          width: double.infinity,
                          height: 42,
                          decoration: (invest.toString().split(".")[0] != "0")
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Color(0xFF98cd4a),
                                        Color(0xFF649f49)
                                      ]),
                                  borderRadius: BorderRadius.circular(5),
                                )
                              : BoxDecoration(
                                  color: Color(0xFF98cd4a).withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                          alignment: Alignment.center,
                          child: Center(
                              child: Text("Review modification",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17)))),
                    )
                  : Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: Color(0xff98cd4a)),
                              child: Checkbox(
                                activeColor: Color(0xFF649f49),
                                value: subVal,
                                onChanged: (bool value) {
                                  setState(() {
                                    subVal = value;
                                    checkbox1 = !checkbox1;
                                  });
                                },
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text:
                                    """I attest that I am not a "restricted person"\npersuant to""",
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                                children: <TextSpan>[
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RuleOneWeb()));
                                        },
                                      text: ' Rule 5130 ',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.teal.shade300)),
                                  TextSpan(
                                      text: 'and ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RuleOneWeb()));
                                        },
                                      text: 'Rule 5131',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.teal.shade300)),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          "There is no assurance that your conditional offer to buy will receive full allocation at all. Your order is conditional on the final sare price being no greater than 20% above the high end of the price range.",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (checkbox1 == true) {
                              var modidata = {
                                "ext_id": widget.modifyDetails['exid'],
                                "buying_power": widget.modifyDetails['buyingp'],
                                "mpid": widget.modifyDetails['mpid'],
                                "account_id":
                                    widget.modifyDetails['account_id'],
                                "attestation_to_rules_5130_and_5131":
                                    subVal == true ? 1 : 0,
                                "dsp": widget.modifyDetails['dsp'],
                                "requested_amount":
                                    widget.modifyDetails['requestAmo'] == null
                                        ? "1200"
                                        : widget.modifyDetails['requestAmo']
                              };
                              getModify(modidata);
                            } else {}
                          },
                          child: Container(
                              decoration: checkbox1 != true
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Color(0xFF98cd4a).withOpacity(0.7))
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color(0xFF98cd4a),
                                            Color(0xFF649f49)
                                          ])),
                              height: 45,
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                "Submit Order",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
