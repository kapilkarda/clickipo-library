import 'dart:convert';

import 'package:counter_flutter/element/circluarloader_widget.dart';
import 'package:counter_flutter/model/offeringDetails_model.dart';
import 'package:counter_flutter/pages/PlaceOrder.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'orderPros.dart';

class OfferingDetails extends StatefulWidget {
  final offid;
  OfferingDetails(this.offid);
  @override
  _OfferingDetailsState createState() => _OfferingDetailsState();
}

class _OfferingDetailsState extends State<OfferingDetails> {
  OffDetailsData offdetailsdata;
  List<UnderwritersList> underwritersList;
  var check = false;

  getOfferingDetailsLi() async {
    var offeid = widget.offid;
    var offeringDType = await Providers().getOfferingDetails(offeid);
    if (offeringDType.error == 0) {
      setState(() {
        offdetailsdata = offeringDType.data;
      });
    } else if (offeringDType.error == 401) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getOfferingDetailsLi();
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (offdetailsdata != null)
                ? Text(
                    offdetailsdata.name,
                    style: TextStyle(
                        color: Color(0xFF002b47),
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  )
                : Text("N/a"),
            (offdetailsdata != null)
                ? Text(offdetailsdata.tickerSymbol,
                    style: TextStyle(
                        color: Colors.blueGrey.shade500, fontSize: 15))
                : Text("N/a")
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: (offdetailsdata == null)
            ? CircularLoadingWidget(
                height: 200,
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          offdetailsdata.offeringTypeName,
                          style:
                              TextStyle(color: Color(0xFF8bc53f), fontSize: 16),
                        ),
                        Text(
                          offdetailsdata.industry,
                          style:
                              TextStyle(color: Color(0xFF8bc53f), fontSize: 16),
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
                          "Anticipated Date:",
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 16),
                        ),
                        (offdetailsdata.tradeDate == null)
                            ? Text("TBD",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w500))
                            : Text(
                                offdetailsdata.tradeDate.substring(0, 10),
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16),
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
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 17),
                        ),
                        (offdetailsdata.tradeDate == null)
                            ? Text(
                                "TBD",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 17),
                              )
                            : Text(
                                offdetailsdata.minPrice.toString() +
                                    ' ' +
                                    '-' +
                                    ' ' +
                                    offdetailsdata.maxPrice.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.blueGrey,
                                ))
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
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 17),
                        ),
                        (offdetailsdata.finalShares == null)
                            ? Text(
                                "TBD",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 17),
                              )
                            : Text(
                                offdetailsdata.finalShares,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 17),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    (offdetailsdata.availableToOrder == 1 &&
                            offdetailsdata.hasOrder == false)
                        ? GestureDetector(
                            onTap: () {
                              var placedata = {
                                "exid": offdetailsdata.extId,
                                "dsp": offdetailsdata.dsp,
                                "minticSize": offdetailsdata.minTicketSize,
                                "maxticSize": offdetailsdata.maxTicketSize,
                                "apprxShare": offdetailsdata.finalShares
                              };
                              print(placedata);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PlaceOrderScreen()));
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
                                      Color(0xFF8bc53f)
                                    ]),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Place order",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )
                        : (offdetailsdata.availableToOrder == 1 &&
                                offdetailsdata.hasOrder == true)
                            ? GestureDetector(
                                onTap: () {
                                  var placedata = {
                                    "exid": offdetailsdata.extId,
                                    "dsp": offdetailsdata.dsp,
                                    "minticSize": offdetailsdata.minTicketSize,
                                    "maxticSize": offdetailsdata.maxTicketSize,
                                    "apprxShare": offdetailsdata.finalShares
                                  };
                                  print(placedata);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlaceOrderScreen()));
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
                                          Color(0xFF8bc53f)
                                        ]),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Modify order",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              )
                            : (offdetailsdata.availableToOrder == 2 &&
                                    offdetailsdata.sixtyMinMailTime == null)
                                ? GestureDetector(
                                    onTap: () {
                                      var placedata = {
                                        "exid": offdetailsdata.extId,
                                        "dsp": offdetailsdata.dsp,
                                        "minticSize":
                                            offdetailsdata.minTicketSize,
                                        "maxticSize":
                                            offdetailsdata.maxTicketSize,
                                        "apprxShare": offdetailsdata.finalShares
                                      };
                                      print(placedata);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlaceOrderScreen()));
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
                                              Color(0xFF8bc53f)
                                            ]),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Place order",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color(0xFF98cd4a),
                                            Color(0xFF8bc53f)
                                          ]),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Not Available at this time",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
                              border: Border.all(
                                  color: Color(0xFF8bc53f), width: 1.5)),
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
                              color: (offdetailsdata.followed == true)
                                  ? Color(0xFF8bc53f)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: (offdetailsdata.followed == true)
                                      ? Colors.white
                                      : Color(0xFF8bc53f),
                                  width: 1.5)),
                          alignment: Alignment.center,
                          child: (offdetailsdata.followed == true)
                              ? InkWell(
                                  onTap: () {
                                    check = !check;
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.check,
                                          color:
                                              (offdetailsdata.followed == true)
                                                  ? Colors.white
                                                  : Color(0xFF8bc53f),
                                          size: 17),
                                      Text(
                                        "Interested",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              : Text(
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
                              color: Colors.blueGrey.shade800,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Text(offdetailsdata.description,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        (offdetailsdata.prospectusUrl != "")
                            ? InkWell(
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
                                                var prourl = offdetailsdata
                                                    .prospectusUrl;
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProspectusWeb(
                                                                prourl)));
                                              },
                                              child: Text("Read",
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 15)),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancel",
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 15)),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.insert_drive_file_outlined,
                                      color: Color(0xFF8bc53f),
                                      size: 15,
                                    ),
                                    Text(" Prospectus",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                              )
                            : Container(),
                        (offdetailsdata.brochureUrl != "")
                            ? InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Brochure'),
                                          content: Text(
                                              'Would you like to read the brochure or email yourself a copy?'),
                                          actions: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                var prourl =
                                                    offdetailsdata.brochureUrl;
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProspectusWeb(
                                                                prourl)));
                                              },
                                              child: Text("Read",
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 15)),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancel",
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 15)),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.insert_drive_file_outlined,
                                      color: Color(0xFF8bc53f),
                                      size: 15,
                                    ),
                                    Text(" Brochure",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "UNDERWRITER(S)",
                      style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: offdetailsdata.underwritersList.length,
                        itemBuilder: (BuildContext context, index) {
                          return Text(
                              offdetailsdata
                                  .underwritersList[index].executingBrokerName,
                              style: TextStyle(
                                  color: Colors.blueGrey.shade400,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400));
                        }),
                  ],
                ),
              ),
      ),
    );
  }
}
