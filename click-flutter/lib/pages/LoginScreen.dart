import 'package:counter_flutter/main.dart';
import 'package:counter_flutter/pages/offering_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16),
                  // color: Colors.redAccent,
                  child: Center(child: Image.asset("assets/images/1app-02.png",height: 100))
              )
          ),
                  Flexible(
                    flex: 1,child: Text("Enter your e-mail to get started",style: TextStyle(color:Color(0xff50c842),fontSize: 16)),
                  ),
                  // Image.asset("basketball.jpg",fit: BoxFit.contain,))),
            Flexible(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0,
                            color: Color(0xff9AB35B)
                        )
                    ),
                  margin: EdgeInsets.only(left: 40,right: 40),
                    child: TextFormField(
                        // style: ,
                      autocorrect: false,
                        decoration: new InputDecoration(
                          // disabledBorder: InputBorder.none,
                          labelText: "Enter e-mail",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(0.0),
                            borderSide: new BorderSide(
                              width: 20.0,
                                // color: Color(0xff90B066)
                            ),
                          ),
                          //fillColor: Colors.green
                        ),
                    )

                )),
            Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.0,
                        color: Color(0xff9AB35B)
                  )
                  ),
                  margin: EdgeInsets.only(left: 40,right: 40),
                  child: TextFormField(
                      autocorrect: false,
                      decoration: new InputDecoration(
                      labelText: "Enter password",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                        borderSide: new BorderSide(
                            width: 20.0,
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                  ),
                )),
            Flexible(
                flex: 1,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("Remember Me",style: TextStyle(color:Color(0xff50c842),fontSize: 16)),
                  ],)
            ),
            Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0) ,
                      gradient:  LinearGradient(colors: [
                        Color(0xffb4e041),
                        Color(0xff50c842)
                      ])
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.8,
                      // color: Colors.lime,
                      child: Center(child: Text("Log IN"))
                  ),
                )
            ),
            Flexible(
                flex: 3,
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    // color: Colors.yellow,

                )
            ),


          ],),
      ),
    );
  }
}
