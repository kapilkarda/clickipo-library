import 'dart:convert';

import 'package:counter_flutter/element/circluarloader_widget.dart';
import 'package:counter_flutter/model/offeringDetails_model.dart';
import 'package:counter_flutter/pages/PlaceOrder.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class OfferingDetails extends StatefulWidget {
  final offid;
  OfferingDetails(this.offid);
  @override
  _OfferingDetailsState createState() => _OfferingDetailsState();
}

class _OfferingDetailsState extends State<OfferingDetails> {
  OffDetailsData offdetailsdata;
  List<UnderwritersList> underwritersList;

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
                    style: TextStyle(color: Color(0xFF002b47), fontSize: 18),
                  )
                : Text("N/a"),
            (offdetailsdata != null)
                ? Text(offdetailsdata.tickerSymbol,
                    style: TextStyle(color: Color(0xFF002b47), fontSize: 15))
                : Text("N/a")
          ],
        ),
        centerTitle: true,
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
                              TextStyle(color: Color(0xFF8bc53f), fontSize: 17),
                        ),
                        Text(
                          offdetailsdata.industry,
                          style:
                              TextStyle(color: Color(0xFF8bc53f), fontSize: 17),
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
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 17),
                        ),
                        (offdetailsdata.tradeDate == null)
                            ? Text("TBD",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500))
                            : Text(
                                offdetailsdata.tradeDate.substring(0, 10),
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 17),
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
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 17),
                        ),
                        (offdetailsdata.tradeDate == null)
                            ? Text(
                                "TBD",
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 17),
                              )
                            : Text(
                                offdetailsdata.minPrice.toString() +
                                    ' ' +
                                    '-' +
                                    ' ' +
                                    offdetailsdata.maxPrice.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade500,
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
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 17),
                        ),
                        (offdetailsdata.finalShares == null)
                            ? Text(
                                "TBD",
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 17),
                              )
                            : Text(
                                offdetailsdata.finalShares,
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 17),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
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
                              colors: [Color(0xFF98cd4a), Color(0xFF649f49)]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Place order",
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
                              border: Border.all(
                                  color: Color(0xFF649f49), width: 1.5)),
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
                              border: Border.all(
                                  color: Color(0xFF649f49), width: 1.5)),
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
                              color: Colors.blueGrey.shade800,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Text(offdetailsdata.description,
                              style: TextStyle(
                                  color: Colors.blueGrey.shade400,
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
                    Text(
                      "UNDERWRITER(S)",
                      style: TextStyle(
                          color: Colors.blueGrey.shade800,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
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
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400));
                        }),
                  ],
                ),
              ),
      ),
    );
  }
}
