import 'package:counter_flutter/main.dart';
import 'package:counter_flutter/pages/my_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

import 'myhomepage.dart';

class CongratulationScreen extends StatefulWidget {
  @override
  _CongratulationScreenState createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen>
    with TickerProviderStateMixin {
  GifController controller1;

  @override
  void initState() {
    controller1 = GifController(vsync: this);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller1.repeat(
    //     min: 0,
    //     max: 2,
    //   );
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Modify Successful",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: ListView(
                children: <Widget>[
                  GifImage(
                    controller: controller1,
                    image: AssetImage(
                      "assets/images/success.gif",
                    ),
                    height: 200,
                    width: 200,
                  ),
                  // Image.asset(
                  //   "assets/images/success.gif",
                  //   height: 200,
                  //   width: 200,
                  // ),
                  Center(
                    child: Text(
                      "Congratulations!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade700,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            """TradeStation has accepted your conditional\n order to buy for\n""",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  'Up to ${String.fromCharCode(036)}12,000 worth of AAAJJ\n ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '(approximately 800 shares).\n\n',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade700)),
                        ],
                      ),
                    ),
                  ),
                  Text(
                      "We will notify you if there are material changes to the offering, when the offering is more effective and priced, and of your final share allocation.",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (29 / 100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyOrder()));
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color(0xFF98cd4a),
                                      Color(0xFF649f49)
                                    ])),
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.4,
                            // color: Colors.lime,
                            child: Center(
                                child: Text(
                              "My Orders",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color(0xFF98cd4a),
                                      Color(0xFF649f49)
                                    ])),
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.4,
                            // color: Colors.lime,
                            child: Center(
                                child: Text(
                              "Done",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
