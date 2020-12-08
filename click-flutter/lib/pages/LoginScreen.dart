import 'package:counter_flutter/main.dart';
import 'package:counter_flutter/pages/offering_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool monVal = false;
  bool _obscureText = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
          const EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 20),
          child: ListView(
            children: [
              Center(
                  child: Image.asset("assets/images/1app-02.png", height: 65)),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text("Enter your e-mail to get started",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(width: 1.5, color: Color(0xff9AB35B))),
                child: TextFormField(
                  style: TextStyle(color: Color(0xff9AB35B)),
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(width: 1.5, color: Color(0xff9AB35B))),
                child: TextFormField(
                  style: TextStyle(color: Color(0xff9AB35B)),
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff9AB35B),
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Color(0xff9AB35B)),
                        child: Checkbox(
                          activeColor: Color(0xff9AB35B),
                          value: monVal,
                          onChanged: (bool value) {
                            setState(() {
                              monVal = value;
                            });
                          },
                        ),
                      ),
                      Text("Remember Me",
                          style: TextStyle(
                              color: Color(0xff9AB35B),
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text("Sign in with TouchId",
                        style: TextStyle(
                            color: Color(0xff9AB35B),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xFF98cd4a), Color(0xFF649f49)])),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    // color: Colors.lime,
                    child: Center(
                        child: Text("Log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )))),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text("Forgot Password?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text("Sign up",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
