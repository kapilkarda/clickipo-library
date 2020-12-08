import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmCancel extends StatefulWidget {
  @override
  _ConfirmCancelState createState() => _ConfirmCancelState();
}

class _ConfirmCancelState extends State<ConfirmCancel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF649f49),
              ),
            ),
            title: Image.asset(
              "assets/images/1app-02.png",
              height: 70,
              width: 120,
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Text(
                    "Are you sure?",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      "Cancelling your order for \n${String.fromCharCode(036)}12,000 of AAAJJ",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                GestureDetector(
                  onTap: () {
                    //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 24, left: 20, right: 20),
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
                            ]),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      // color: Colors.lime,
                      child: Center(
                          child: Text("I'm sure, Cancel offer",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20)))),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 24, left: 20, right: 20),
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
                            ]),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      // color: Colors.lime,
                      child: Center(
                          child: Text("Don't cancel",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20)))),
                )
              ],
            ),
          ),
        ));
  }
}
