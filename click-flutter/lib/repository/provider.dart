import 'dart:convert';
import 'dart:io';

import 'package:counter_flutter/model/interested_model.dart';
import 'package:counter_flutter/model/login_model.dart';
import 'package:counter_flutter/model/modifyOrder_model.dart';
import 'package:counter_flutter/model/offeringDetails_model.dart';
import 'package:counter_flutter/model/offering_model.dart';
import 'package:counter_flutter/model/order_model.dart';
import 'package:counter_flutter/model/order_reconfirm.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Providers {
  String baseUrl = 'https://api-dev.clickipo.com/';

//Check login
  Future<LoginModel> getLogin(loginData) async {
    final String url = baseUrl + "users/login";
    final client = new http.Client();
    final response = await client.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(loginData),
    );
    return LoginModel.fromJson(json.decode(response.body));
  }

  Future<OfferingModel> getOfferingList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('auth_token');
    final String url = baseUrl + "v1/offerings";
    print("ghgh $url");
    final client = new http.Client();
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: authToken
      },
    );
    return OfferingModel.fromJson(json.decode(response.body));
  }

  Future<OrderModel> getOrderList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('auth_token');
    final String url = baseUrl + "v1/orders";
    final client = new http.Client();
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: authToken
      },
    );
    return OrderModel.fromJson(json.decode(response.body));
  }

  Future<OfferingDetailsModel> getOfferingDetails(offeid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('auth_token');
    final String url = baseUrl + "v1/offerings/?ext_id=$offeid";
    final client = new http.Client();
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: authToken
      },
    );
    return OfferingDetailsModel.fromJson(json.decode(response.body));
  }

  Future<ModifyorderModel> getModifyOrder(modiData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('auth_token');
    final String url = baseUrl + "orders";
    final client = new http.Client();
    final response = await client.put(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: authToken
      },
      body: json.encode(modiData),
    );
    return ModifyorderModel.fromJson(json.decode(response.body));
  }

  Future<ModifyorderModel> getDeletetOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('auth_token');
    final String url = baseUrl + "orders";
    final client = new http.Client();
    final response = await client.delete(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: authToken
      },
    );
    return ModifyorderModel.fromJson(json.decode(response.body));
  }

  Future<OrderRecModel> getorderReco(ordRedata) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('auth_token');
    final String url = baseUrl + "orders/ioi_reconfirm";
    final client = new http.Client();
    final response = await client.post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: authToken
      },
      body: json.encode(ordRedata),
    );
    return OrderRecModel.fromJson(json.decode(response.body));
  }

  Future<InterstedModel> getInteresterd(interData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('auth_token');
    final String url = baseUrl + "offerings/save";
    final client = new http.Client();
    final response = await client.post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: authToken
      },
      body: json.encode(interData),
    );
    return InterstedModel.fromJson(json.decode(response.body));
  }
}
