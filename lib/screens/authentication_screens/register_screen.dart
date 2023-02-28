import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:registrar_general_prototype/apis/ghanacard_Validation_api.dart';
import 'package:registrar_general_prototype/apis/sms_api.dart';
import 'package:registrar_general_prototype/models/ghanaCard_model.dart';
import 'package:registrar_general_prototype/screens/authentication_screens/loginscreen.dart';
import 'package:registrar_general_prototype/screens/authentication_screens/otp_screen.dart';
import '../../utils/constants.dart';
import '../../widgets/authWidget.dart';
import '../home_screens/mainpage.dart';

class Register_Screen extends StatefulWidget {
  final String cardNumber;
  const Register_Screen({
    super.key,
    required this.cardNumber,
  });

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  final keyForm = GlobalKey<FormState>();
  bool isRememberme = false;
  bool isLoading = false;
  bool isOtp = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final ghanaCardController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();
  final mobileController = TextEditingController();
  get otpController => null;
  String _generatedOtp = '';

  Future<Ghanacard_Model>? _futureData;

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: _height <= 820 ? 30 : 80),
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
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: _height <= 820 ? 8 : 15.0, left: 20, right: 20),
                    child: Container(
                        height: isOtp
                            ? _height / 2.2
                            : _height <= 820
                                ? _height / 1.25
                                : _height / 1.6,
                        width: _width,
                        padding: EdgeInsets.all(_height <= 820 ? 20 : 30),
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
                        child: Builder(builder: (context) {
                          return FutureBuilder(
                              future: GhanaCard_Validation.getCardDetails(
                                  widget.cardNumber, context),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return isOtp
                                      ? Form(
                                          key: keyForm,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'Verification',
                                                  style: GlobalVars
                                                      .kBigTitleBblack,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text(
                                                  'We have sent you an SMS with  a  code to number (User number)',
                                                  style: GlobalVars
                                                      .kSecTitleLblack,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Center(
                                                  child: OTPTextField(
                                                      controller: otpController,
                                                      length: 4,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      textFieldAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      fieldWidth: 45,
                                                      fieldStyle:
                                                          FieldStyle.box,
                                                      outlineBorderRadius: 15,
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                      onChanged: (pin) {
                                                        print(
                                                            "Changed: " + pin);
                                                      },
                                                      onCompleted: (pin) {
                                                        print("Completed: " +
                                                            pin);
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
                                                    Timer(Duration(seconds: 5),
                                                        () {
                                                      final snackBar = SnackBar(
                                                        /// need to set following properties for best effect of awesome_snackbar_content
                                                        elevation: 0,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        content:
                                                            AwesomeSnackbarContent(
                                                          title: 'Verified',
                                                          message:
                                                              'account has been verified ',

                                                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                          contentType:
                                                              ContentType
                                                                  .success,
                                                        ),
                                                      );

                                                      ScaffoldMessenger.of(
                                                          context)
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(
                                                            snackBar);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Login_Page()));

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
                                                        color:
                                                            GlobalVars.kPrimary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Center(
                                                        child: isLoading
                                                            ? SpinKitRipple(
                                                                color: Colors
                                                                    .white,
                                                                size: 23,
                                                              )
                                                            : Text(
                                                                'SUBMIT',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins-Medium',
                                                                  fontSize: 18,
                                                                  letterSpacing:
                                                                      3,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 3.0,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Do you want to cancel ?",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Poppins-Regular',
                                                          fontSize: 14,
                                                          color: GlobalVars
                                                              .kSecondary,
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            isOtp = false;
                                                          });
                                                        },
                                                        child: Text(
                                                          "Go back",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-SemiBold',
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
                                        )
                                      : Form(
                                          key: keyForm,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: _height <= 820
                                                          ? 15
                                                          : 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.lock,
                                                        color: Colors.black,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "Create New Account",
                                                        style: GlobalVars
                                                            .kMediumStyle,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                buildTextField(
                                                  nameController,
                                                  IconlyLight.user,
                                                  "${snapshot.data!.name}",
                                                  false,
                                                  false,
                                                ),
                                                buildTextField(
                                                    emailController,
                                                    IconlyLight.calendar,
                                                    "${snapshot.data!.birthDate}",
                                                    false,
                                                    true),
                                                buildTextField(
                                                    phoneController,
                                                    CupertinoIcons.phone_circle,
                                                    "${snapshot.data!.mobileNo}",
                                                    false,
                                                    true),
                                                buildTextField(
                                                    ghanaCardController,
                                                    CupertinoIcons.creditcard,
                                                    "${snapshot.data!.tin}",
                                                    false,
                                                    true),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                // buildTextField(
                                                //     passController,
                                                //     IconlyLight.lock,
                                                //     "Enter Password",
                                                //     true,
                                                //     false),
                                                // buildTextField(
                                                //     confirmpassController,
                                                //     IconlyLight.lock,
                                                //     "Confirm Password",
                                                //     true,
                                                //     false),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isLoading = true;
                                                    });
                                                    Sms_Api.sendSms(
                                                            snapshot
                                                                .data!.mobileNo,
                                                            '8467',
                                                            context)
                                                        .then((value) {
                                                      setState(() {
                                                        isLoading = false;
                                                        isOtp = true;
                                                      });
                                                    });
                                                  },
                                                  child: Container(
                                                    height: _height <= 820
                                                        ? 50
                                                        : 58,
                                                    width: 280,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          GlobalVars.kPrimary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: isLoading
                                                          ? SpinKitRipple(
                                                              color:
                                                                  Colors.white,
                                                              size: 23,
                                                            )
                                                          : Text(
                                                              'REGISTER',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins-Medium',
                                                                fontSize: 18,
                                                                letterSpacing:
                                                                    3,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 3.0,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Have an account already ?",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Poppins-Regular',
                                                          fontSize: 14,
                                                          color: GlobalVars
                                                              .kSecondary,
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "Login",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins-SemiBold',
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
                                        );
                                } else {
                                  return SpinKitPulse(
                                    size: 30,
                                    color: GlobalVars.kPrimary,
                                  );
                                }
                              });
                        })))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Ghana_Card_Detail extends StatefulWidget {
  final Ghanacard_Model? data;
  const Ghana_Card_Detail({super.key, this.data});

  @override
  State<Ghana_Card_Detail> createState() => _Ghana_Card_DetailState();
}

class _Ghana_Card_DetailState extends State<Ghana_Card_Detail> {
  final keyForm = GlobalKey<FormState>();
  bool isRememberme = false;
  bool isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final ghanaCardController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();
  final mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Form(
      key: keyForm,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: _height <= 820 ? 15 : 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Create New Account",
                    style: GlobalVars.kMediumStyle,
                  )
                ],
              ),
            ),
            buildTextField(
              nameController,
              IconlyLight.user,
              "${widget.data?.name}",
              false,
              false,
            ),
            buildTextField(
                emailController, IconlyLight.message, "Email", false, true),
            buildTextField(
                phoneController, CupertinoIcons.phone_circle, "", false, true),
            buildTextField(ghanaCardController, CupertinoIcons.creditcard, "",
                false, true),
            buildTextField(passController, IconlyLight.lock, "Enter Password",
                true, false),
            buildTextField(confirmpassController, IconlyLight.lock,
                "Confirm Password", true, false),
            InkWell(
              onTap: (() {
                setState(() {
                  isLoading = true;
                });
                Timer(Duration(seconds: 3), () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Otp_Screen()));

                  setState(() {
                    isLoading = false;
                  });
                });
              }),
              child: Container(
                height: _height <= 820 ? 50 : 58,
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
                          'REGISTER',
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 3.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account already ?",
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
                      "Login",
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
    );
  }
}
