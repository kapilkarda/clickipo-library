import 'dart:convert';

import 'package:counter_flutter/main.dart';
import 'package:counter_flutter/model/login_model.dart';
import 'package:counter_flutter/repository/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myhomepage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool monVal = false;
  bool _obscureText = true;
  String email;
  String password;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginData lodata;

  _submit() async {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      var addressData = {
        "email": email,
        "encrypted_password":
            "4ff3e8922e53309578d694c2dafb41d744af5c4004716f178552449149cd502e9c7022d18cdef4bbe796652d0862f019653e96796ad5d05bffb0f44baaa33528",
        "client_ip": "47.247.56.187"
      };
      var logdata = await Providers().getLogin(addressData);
      setState(() {
        lodata = logdata.data;
      });
      if (logdata.error == 0) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('auth_token', lodata.token);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else if (logdata.error == 2014) {
        _scaffoldKey.currentState
            .showSnackBar(new SnackBar(content: new Text(logdata.message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                    child:
                        Image.asset("assets/images/1app-02.png", height: 65)),
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
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(width: 1.2, color: Color(0xff98cd4a))),
                  child: TextFormField(
                    initialValue: 'varun@clickipoholdings.com',
                    onSaved: (value) {
                      email = value;
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
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
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(width: 1.2, color: Color(0xff98cd4a))),
                  child: TextFormField(
                    initialValue: "asdfasdfas",
                    onSaved: (value) {
                      password = value;
                    },
                    style: TextStyle(color: Color(0xff98cd4a)),
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
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Color(0xff98cd4a)),
                          child: Checkbox(
                            activeColor: Color(0xff98cd4a),
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
                                color: Color(0xff98cd4a),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text("Sign in with TouchId",
                          style: TextStyle(
                              color: Color(0xff98cd4a),
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
                    _submit();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xff98cd4a), Color(0xFF649f49)])),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.8,
                      // color: Colors.lime,
                      child: Center(
                          child: Text("Log in",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )))),
                ),
                SizedBox(
                  height: 35,
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
                          color: Colors.blueGrey.shade800,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
