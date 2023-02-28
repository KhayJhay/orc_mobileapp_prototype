import 'package:flutter/material.dart';

class GlobalVars {
  static const kPrimary = Color(0xFF282565);
  static const kSecondary = Color(0xFF88869f);
  static const kTertiary = Color(0xFF09AB98);
  static const kHeaderstyle =
      TextStyle(fontSize: 20, fontFamily: 'Poppins-Bold');
  static const kTitleStyle = TextStyle(
      fontSize: 24,
      color: Color(0xFF01002f),
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins-Bold');
  static const kSubtitleStyle = TextStyle(
      fontSize: 18, color: Color(0xFF88869f), fontFamily: 'Poppins-Regular');
  static const kMediumStyle = TextStyle(
      fontSize: 18, color: Color(0xFF01002f), fontFamily: 'Poppins-SemiBold');
  static const kSecTitleBblack =
      TextStyle(fontSize: 16, fontFamily: 'Poppins-Bold', color: Colors.black);
  static const kBigTitleBblack =
      TextStyle(fontSize: 17, fontFamily: 'Poppins-Bold', color: Colors.black);
  static const kSecTitleRblack = TextStyle(
      fontSize: 20, fontFamily: 'Poppins-Regular', color: Colors.black);
  static const kSecTitleLblack = TextStyle(
      fontSize: 15, fontFamily: 'Poppins-Light', color: Colors.black54);
}

tableRowText(String title) => Text(title,
    style: TextStyle(
        fontSize: 14, color: Color(0xFF0D2A47), fontWeight: FontWeight.bold));

tableColText(String title) =>
    Text(title, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic));

tableColStatusText(String title, Color colour, VoidCallback press) =>
    TextButton(
      onPressed: press,
      child: Text(title,
          style: TextStyle(
              fontSize: 12, color: colour, fontStyle: FontStyle.italic)),
    );
