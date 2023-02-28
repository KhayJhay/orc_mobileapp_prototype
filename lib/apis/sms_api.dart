import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class Sms_Api {
  static Future sendSms(
      String phoneNumber, String message, BuildContext context) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://sms.nalosolutions.com/smsbackend/clientapi/Resl_Nalo/send-message/?username=ORC-GHANA&password=Nalo@unit3d01&type=0&dlr=1&destination=$phoneNumber&source=ORC-GHANA&message=$message'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Sms Alert',
          message: 'An otp code has been sent to your sms',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.warning,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return Future.value();
    } else {
      print(response.reasonPhrase);
    }
  }
}
