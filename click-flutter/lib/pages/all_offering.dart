import 'dart:convert';

import 'package:counter_flutter/element/circluarloader_widget.dart';
import 'package:counter_flutter/model/offering_model.dart';
import 'package:counter_flutter/model/user_model.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen.dart';
import 'modifyScreen.dart';
import 'offering_details.dart';

class AllOffering extends StatefulWidget {
  @override
  _AllOfferingState createState() => _AllOfferingState();
}

class _AllOfferingState extends State<AllOffering> {
  var tap = -1;
  var check = false;

  List<OfferingData> offeringdata;
  UserData userdata;

  getUserType() async {
    var userType = await Providers().getUser();
    if (userType.error == 0) {
      userdata = userType.data;
    } else if (userType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

  getInterestedType(interData) async {
    var interestedType = await Providers().getInteresterd(interData);
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
    getUserType();
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
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                  child: Image.network(
                                      "https:${offeringdata[index].logoSmall}"),
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

                                    (offeringdata[index].availableToOrder ==
                                                0 &&
                                            userdata.brokerConnection
                                                    .toString ==
                                                null)
                                        ? (offeringdata[index].followed == true)
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF8bc53f),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Color(0xFF8bc53f),
                                                  ),
                                                ),
                                                padding: EdgeInsets.only(
                                                    left: 7,
                                                    right: 7,
                                                    top: 2,
                                                    bottom: 2),
                                                child: Text(
                                                  "Intrested",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Color(0xFF8bc53f),
                                                  ),
                                                ),
                                                padding: EdgeInsets.only(
                                                    left: 7,
                                                    right: 7,
                                                    top: 2,
                                                    bottom: 2),
                                                child: Text(
                                                  "Intrested?",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              )
                                        : (offeringdata[index]
                                                    .availableToOrder ==
                                                1)
                                            ? (offeringdata[index].maxPrice !=
                                                    0)
                                                ? (offeringdata[index]
                                                            .hasOrder ==
                                                        false)
                                                    ? Text("Place Order")
                                                    : InkWell(
                                                        onTap: () {
                                                          var modifyDetails = {
                                                            "exid":
                                                                offeringdata[
                                                                        index]
                                                                    .extId,
                                                            "logo_small":
                                                                offeringdata[
                                                                        index]
                                                                    .logoSmall,
                                                            "minPrice":
                                                                offeringdata[
                                                                        index]
                                                                    .minPrice,
                                                            "maxPrice":
                                                                offeringdata[
                                                                        index]
                                                                    .maxPrice,
                                                            "ticminPrice":
                                                                offeringdata[
                                                                        index]
                                                                    .minTicketSize,
                                                            "ticmaxPrice":
                                                                offeringdata[
                                                                        index]
                                                                    .maxTicketSize,
                                                            "finalPrice":
                                                                offeringdata[
                                                                        index]
                                                                    .finalShares,
                                                            "orderDollarsh":
                                                                offeringdata[
                                                                        index]
                                                                    .ordrDollarShare,
                                                            "buyingp": userdata
                                                                .brokerConnection
                                                                .buyingPower,
                                                            "dsp": offeringdata[
                                                                    index]
                                                                .dsp,
                                                            "account_id": userdata
                                                                .brokerConnection
                                                                .accountId,
                                                            "mpid": userdata
                                                                .brokerConnection
                                                                .mpid
                                                          };
                                                          print(
                                                              "jkjkj   $modifyDetails");
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      ModifyOrder(
                                                                          modifyDetails)));
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey.shade700,
                                                            border: Border.all(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFF8bc53f),
                                                            ),
                                                          ),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 7,
                                                                  right: 7,
                                                                  top: 2,
                                                                  bottom: 2),
                                                          child: Text(
                                                            "Modify",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                : (offeringdata[index]
                                                            .followed ==
                                                        true)
                                                    ? InkWell(
                                                        onTap: () {
                                                          check = !check;
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF8bc53f),
                                                            border: Border.all(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFF8bc53f),
                                                            ),
                                                          ),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 7,
                                                                  right: 7,
                                                                  top: 2,
                                                                  bottom: 2),
                                                          child: Text(
                                                            "Intrested",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Color(
                                                                0xFF8bc53f),
                                                          ),
                                                        ),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 7,
                                                                right: 7,
                                                                top: 2,
                                                                bottom: 2),
                                                        child: Text(
                                                          "Intrested?",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )
                                            : (offeringdata[index].hasOrder ==
                                                    true)
                                                ? Text("close")
                                                : (offeringdata[index]
                                                            .followed ==
                                                        true)
                                                    ? InkWell(
                                                        onTap: () {
                                                          check = !check;
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF8bc53f),
                                                            border: Border.all(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFF8bc53f),
                                                            ),
                                                          ),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 7,
                                                                  right: 7,
                                                                  top: 2,
                                                                  bottom: 2),
                                                          child: Text(
                                                            "Intrested",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Color(
                                                                0xFF8bc53f),
                                                          ),
                                                        ),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 7,
                                                                right: 7,
                                                                top: 2,
                                                                bottom: 2),
                                                        child: Text(
                                                          "Intrested?",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )

                                    // InkWell(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       tap == -1 ? tap = index : tap = -1;
                                    //       check = !check;
                                    //       print("rtrst $tap");
                                    //       print("hghs $check");
                                    //     });
                                    //     var interData = {
                                    //       "ext_id": offeringdata[index].extId,
                                    //       "save": check
                                    //     };
                                    //     getInterestedType(interData);
                                    //   },
                                    //   child: Container(
                                    //     decoration: BoxDecoration(
                                    //       color: (tap == index && check == true)
                                    //           ? Color(0xFF8bc53f)
                                    //           : Colors.white,
                                    //       border: Border.all(
                                    //         width: 1,
                                    //         color: Color(0xFF8bc53f),
                                    //       ),
                                    //     ),
                                    //     padding: EdgeInsets.only(
                                    //         left: 5,
                                    //         right: 5,
                                    //         top: 5,
                                    //         bottom: 5),
                                    //     child: Text(
                                    //       "Interested?",
                                    //       style: TextStyle(
                                    //           color: (tap == index)
                                    //               ? Colors.white
                                    //               : Color(0xFF8bc53f)),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
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
                                    (offeringdata[index].minPrice == null)
                                        ? Text("TBD",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500))
                                        : Text(
                                            offeringdata[index]
                                                .tradeDate
                                                .substring(0, 10),
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
                                    (offeringdata[index].minPrice == null)
                                        ? Text("TBD",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500))
                                        : Text(
                                            offeringdata[index]
                                                    .minPrice
                                                    .toString() +
                                                ' ' +
                                                '-' +
                                                ' ' +
                                                offeringdata[index]
                                                    .maxPrice
                                                    .toString(),
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
