import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String serverAddress = 'https://recipes-nkpy.onrender.com/';

class HttpConnect {
  static Future<Map<String, dynamic>> getData({
    required String endpoint,
  }) async {
    var url = Uri.parse('$serverAddress$endpoint');

    var client = http.Client();

    try {
      var response = await client.get(url);
      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  

  static Future<Map<String, dynamic>> postData({required Map data, required String endpoint}) async {
    var url = Uri.parse('$serverAddress$endpoint');

    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data), 
      );
      print(response.body);
      return jsonDecode(response.body); 
    } catch (e) {
      rethrow;
    }
  }

}
