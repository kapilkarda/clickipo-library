import 'dart:convert';

import 'package:counter_flutter/element/circluarloader_widget.dart';
import 'package:counter_flutter/model/offering_model.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'offering_details.dart';

class AllOffering extends StatefulWidget {
  @override
  _AllOfferingState createState() => _AllOfferingState();
}

class _AllOfferingState extends State<AllOffering> {
  var tap = -1;
  var check = false;

  List<OfferingData> offeringdata;

  getInterestedType(interData) async {
    var interestedType = await Providers().getInteresterd(interData);
    print(json.encode(interestedType));
    if (interestedType.error == 0) {
      setState(() {
        //offeringdata = offeringType.data;
      });
    } else if (interestedType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

  getOfferingTyp() async {
    var offeringType = await Providers().getOfferingList();
    if (offeringType.error == 0) {
      setState(() {
        offeringdata = offeringType.data;
      });
    } else if (offeringType.error == 401) {
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
      body: (offeringdata == null)
          ? CircularLoadingWidget(
              height: 200,
            )
          : ListView.builder(
              itemCount: offeringdata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    var offid = offeringdata[index].extId;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OfferingDetails(offid)));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  color: Colors.yellow.shade100,
                                  height: 50,
                                  width: 50,
                                  margin: EdgeInsets.only(bottom: 5),
                                ),
                                Center(
                                  child: Text(
                                    offeringdata[index].tickerSymbol,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(offeringdata[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          tap == -1 ? tap = index : tap = -1;
                                          check = !check;
                                          print("rtrst $tap");
                                          print("hghs $check");
                                        });
                                        var interData = {
                                          "ext_id": offeringdata[index].extId,
                                          "save": check
                                        };
                                        getInterestedType(interData);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: (tap == index && check == true)
                                              ? Color(0xFF8bc53f)
                                              : Colors.white,
                                          border: Border.all(
                                            width: 1,
                                            color: Color(0xFF8bc53f),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 5,
                                            bottom: 5),
                                        child: Text(
                                          "Interested?",
                                          style: TextStyle(
                                              color: (tap == index)
                                                  ? Colors.white
                                                  : Color(0xFF8bc53f)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Anticipated Date:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                    Text("TBD",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Anticipated Price: ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500)),
                                    Text("TBD",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
