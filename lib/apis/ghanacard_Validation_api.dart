import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:registrar_general_prototype/screens/authentication_screens/register_screen.dart';
import 'dart:convert';
import '../models/ghanaCard_model.dart';

class GhanaCard_Validation {
  static Future<Ghanacard_Model> getCardDetails(
      String cardNumber, BuildContext context) async {
    http.Response response = await http.get(
      Uri.parse(
          "https://staging-api.digitalpayment.online/tin/business/verify/nia/" +
              cardNumber),
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJSR0QiLCJpc3MiOiJTeXNfQWRtaW4iLCJleHAiOjE3MDgxNzE3OTB9.98PCsdWrWR55kWUSQjcNgt1JmCHJN15TLrBWYmFJlCQ',
      },
    );
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      var cardData = responseData['data']['data'];
      var cardModel = Ghanacard_Model.fromJson(cardData);
      return cardModel;
    } else {
      print(responseData['message']);
    }
    return responseData;
  }
}
