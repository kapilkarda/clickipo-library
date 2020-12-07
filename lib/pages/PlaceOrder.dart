import 'package:counter_flutter/pages/CongratulationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  var tapped = false,checkbox=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: 30,
              color: Color(0xff50c842),
            ),
          ),
          title: Column(
            children: <Widget>[
              Text("Place Order",style: TextStyle(color: Color(0xff50c842),fontWeight: FontWeight.bold),),
              Text("IPO details here",style: TextStyle(color: Color(0xff50c842),fontSize: 12),)
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
            Flexible(
              flex: 1,
              child: Column(children: [
                Text("Anticipated price: #12050-12",style: TextStyle(fontSize: 16,color: Colors.blueGrey),),
                Text("Shares offered: 100,000",style: TextStyle(fontSize: 16,color: Colors.blueGrey),),
                Text("Ticket size: #10-#20,000",style: TextStyle(fontSize: 16,color: Colors.blueGrey),),
              ]),
            ),
            Flexible(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Text("Buying power: # 12,1212",style: TextStyle(fontSize: 16,color: Colors.blueGrey),))),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 32,bottom: 32,right: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Investment amount",style: TextStyle(fontSize: 16,color:  Colors.blueGrey)),
                  Text(String.fromCharCode(036),style: TextStyle(fontSize: 20,color: Color(0xff50c842)),),
                  Text("1200",style: TextStyle(fontSize: 20, color: Color(0xff50c842)))
                ],),
              ),
            ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 32,bottom: 32,right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Approximate shares",style: TextStyle(fontSize: 16,color:  Colors.blueGrey)),
                    Text("800",style: TextStyle(fontSize: 20))
                  ],),
                ),
              ),
              tapped==false?GestureDetector(
                  onTap: (){
                    setState(() {
                      tapped = true;
                    });
                  },
                  child: Container(
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0) ,
                      gradient:  LinearGradient(colors: [
                      Color(  0xffb4e041),
                      Color(0xff50c842)
                      ])
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.8,
                    // color: Colors.lime,
                      child: Center(child: Text("Review Order"))
                ),
              )
                  :Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Text("This order will be placed through your Trade station account.",textAlign: TextAlign.center,),
                    Text("There is no assurance that your conditional offer to buy will receive full allocation at all. Your order is conditional on the final sare price being no greater than 20% above the high end of the price range.",textAlign: TextAlign.center,),
                    SizedBox(height: 20,),
                    Row(children: <Widget>[
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            checkbox = !checkbox;
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.all(8) ,
                            height: 20,width: 20,
                            color: checkbox==false?Colors.red:Colors.green),
                      ),
                      RichText(
                        text: TextSpan(
                          text: """I attest that I am not a "restricted person" persuant to\n""",
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: 'Rule 5031 ', style: TextStyle(decoration: TextDecoration.underline,color: Colors.lightBlueAccent)),
                            TextSpan(text: 'and ', style: TextStyle(color: Colors.black)),
                            TextSpan(text: 'Rule 5131', style: TextStyle(decoration: TextDecoration.underline,color: Colors.lightBlueAccent)),
                          ],
                        ),
                      )
                    ],),
                      SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        setState(() {

                          if(checkbox==true)
                            {
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> CongratulationScreen()));
                            }

                        });
                      },
                      child: Container(
                          decoration: checkbox==true ?BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0) ,
                              gradient:  LinearGradient(colors: [
                                Color(  0xffb4e041),
                                Color(0xff50c842)
                              ])
                          ):BoxDecoration(
                              gradient:  LinearGradient(colors: [
                                Colors.black38,
                                Colors.grey
                              ])),
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.8,
                          // color: Colors.lime,
                          child: Center(child: Text("Submit Conditional Offer to Buy",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))
                      ),
                    )

                  ],
                )
              )


            ],),
        ),
      ),
    );
  }
}
