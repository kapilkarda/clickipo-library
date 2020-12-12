import 'dart:convert';

import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'myhomepage.dart';

class ModifyOrder extends StatefulWidget {
  final modifyDetails;
  ModifyOrder(this.modifyDetails);
  @override
  _ModifyOrderState createState() => _ModifyOrderState();
}

class _ModifyOrderState extends State<ModifyOrder> {
  bool monVal = false;
  var checkbox = false;
  var invest;

  getModify(modiData) async {
    var morderType = await Providers().getModifyOrder(modiData);
    print(json.encode(morderType));
    if (morderType.error == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
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
          height: 70,
          width: 120,
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
                              initialValue:
                                  widget.modifyDetails['requestAmo'].toString(),
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              onChanged: (text) {
                                invest = int.parse(text) /
                                    widget.modifyDetails['maxPrice'];
                                setState(() {});
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
                        .copyWith(unselectedWidgetColor: Color(0xFF649f49)),
                    child: Checkbox(
                      activeColor: Color(0xFF649f49),
                      value: monVal,
                      onChanged: (bool value) {
                        setState(() {
                          monVal = value;
                          checkbox = !checkbox;
                          print("euei $monVal");
                        });
                      },
                    ),
                  ),
                  Text("Make as new default amount"),
                ],
              ),
              GestureDetector(
                onTap: () {
                  var modidata = {
                    "ext_id": widget.modifyDetails['exid'],
                    "buying_power": widget.modifyDetails['buyingp'],
                    "mpid": widget.modifyDetails['mpid'],
                    "account_id": widget.modifyDetails['account_id'],
                    "attestation_to_rules_5130_and_5131":
                        monVal == true ? 1 : 0,
                    "dsp": widget.modifyDetails['dsp'],
                    "requested_amount": widget.modifyDetails['requestAmo']
                  };
                  print(modidata);
                  getModify(modidata);
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xFF98cd4a), Color(0xFF649f49)])),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      "Review modification",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
