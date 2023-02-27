import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment {
  static Future getPaymentResponse(context) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJSR0QiLCJpc3MiOiJTeXNfQWRtaW4iLCJleHAiOjE3MDgxNzE3OTB9.98PCsdWrWR55kWUSQjcNgt1JmCHJN15TLrBWYmFJlCQ'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            "https://staging-api.digitalpayment.online/payment/initiatePayment"));
    request.body = json.encode({
      "organizationCode": "RGD",
      "organizationName": "Registrar General Department",
      "branchCode": "01",
      "branchName": "Accra-Main",
      "name": "Alexander Odoom",
      "phone": "0554654834",
      "email": "aaodoom@gmail.com",
      "billNo": "01234567891BRHCL",
      "billAmount": 1.00,
      "debitAmount": 1.00,
      "billType": "Business-Registration",
      "description": "Hommies Company Ltd",
      "clientReference": "01234567891BRHCL",
      "cancellationUrl": "https://orc-gh-demo.net/api/",
      "returnUrl": "https://orc-gh-demo.net/api/",
      "callbackUrl": "https://orc-gh-demo.net/api/",
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseString = await response.stream.bytesToString();
    final responseData = json.decode(responseString);

    var url = responseData['data']['checkoutURL'];

    if (response.statusCode == 200) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Payment Successful',
          message: 'You have succefully paid for your registration',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      launch(url);
      return Future.value();
    } else {
      print(response.reasonPhrase);
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Unsuccessful',
          message: '${response.statusCode}',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.warning,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return Future.value();
    }
  }
}
