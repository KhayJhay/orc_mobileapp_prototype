import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/ghanaCard_model.dart';

class GhanaCard_Validation {
  static Future<Ghanacard_Model> getCardDetails(String cardNumber) async {
    http.Response response = await http.get(
      Uri.parse(
          "https://staging-api.digitalpayment.online/tin/business/verify/nia/" +
              cardNumber),
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJSR0QiLCJpc3MiOiJTeXNfQWRtaW4iLCJleHAiOjE3MDgxNzE3OTB9.98PCsdWrWR55kWUSQjcNgt1JmCHJN15TLrBWYmFJlCQ',
      },
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Ghanacard_Model.fromJson(responseData['data']['data']);
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}
