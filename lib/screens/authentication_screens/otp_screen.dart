import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:registrar_general_prototype/screens/authentication_screens/loginscreen.dart';

import '../../utils/constants.dart';
import 'register_screen.dart';

class Otp_Screen extends StatefulWidget {
  const Otp_Screen({super.key});

  @override
  State<Otp_Screen> createState() => _Otp_ScreenState();
}

class _Otp_ScreenState extends State<Otp_Screen> {
  final keyForm = GlobalKey<FormState>();
  get otpController => null;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bg.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/pngs/orclogo.png",
                          height: 80,
                        ),
                        Container(
                          height: 45,
                          width: 1.5,
                          color: GlobalVars.kPrimary,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          "assets/pngs/COA.png",
                          height: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                  child: Container(
                    height: _height <= 820 ? _height / 2.0 : _height / 2.3,
                    width: _width,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 3,
                          spreadRadius: 4,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: keyForm,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Verification',
                              style: GlobalVars.kBigTitleBblack,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'We have sent you an SMS with  a  code to number (User number)',
                              style: GlobalVars.kSecTitleLblack,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: OTPTextField(
                                  controller: otpController,
                                  length: 4,
                                  width: MediaQuery.of(context).size.width,
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  fieldWidth: 45,
                                  fieldStyle: FieldStyle.box,
                                  outlineBorderRadius: 15,
                                  style: TextStyle(fontSize: 17),
                                  onChanged: (pin) {
                                    print("Changed: " + pin);
                                  },
                                  onCompleted: (pin) {
                                    print("Completed: " + pin);
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: (() {
                                setState(() {
                                  isLoading = true;
                                });
                                Timer(Duration(seconds: 5), () {
                                  final snackBar = SnackBar(
                                    /// need to set following properties for best effect of awesome_snackbar_content
                                    elevation: 0,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      title: 'Verified',
                                      message: 'account has been verified ',

                                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                      contentType: ContentType.success,
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(snackBar);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login_Page()));

                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              }),
                              child: Center(
                                child: Container(
                                  height: 58,
                                  width: 280,
                                  decoration: BoxDecoration(
                                    color: GlobalVars.kPrimary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: isLoading
                                        ? SpinKitRipple(
                                            color: Colors.white,
                                            size: 23,
                                          )
                                        : Text(
                                            'SUBMIT',
                                            style: TextStyle(
                                              fontFamily: 'Poppins-Medium',
                                              fontSize: 18,
                                              letterSpacing: 3,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Do you want to cancel ?",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      fontSize: 14,
                                      color: GlobalVars.kSecondary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Go back",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontSize: 14,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
