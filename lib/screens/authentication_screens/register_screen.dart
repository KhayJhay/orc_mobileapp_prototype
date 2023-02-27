import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/models/ghanaCard_model.dart';
import 'package:registrar_general_prototype/screens/authentication_screens/loginscreen.dart';
import 'package:registrar_general_prototype/screens/authentication_screens/otp_screen.dart';
import '../../utils/constants.dart';
import '../../widgets/authWidget.dart';
import '../home_screens/mainpage.dart';

class Register_Screen extends StatefulWidget {
  final Ghanacard_Model data_model;
  const Register_Screen({super.key, required this.data_model});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
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
                      height: _height <= 820 ? _height / 1.25 : _height / 1.4,
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
                      child: Form(
                        key: keyForm,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: _height <= 820 ? 15 : 30),
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
                                "${widget.data_model.name}",
                                false,
                                false,
                              ),
                              buildTextField(emailController,
                                  IconlyLight.message, "Email", false, true),
                              buildTextField(
                                  phoneController,
                                  CupertinoIcons.phone_circle,
                                  "Mobile Number",
                                  false,
                                  true),
                              buildTextField(
                                  ghanaCardController,
                                  CupertinoIcons.creditcard,
                                  "Ecowas Card",
                                  false,
                                  true),
                              buildTextField(passController, IconlyLight.lock,
                                  "Enter Password", true, false),
                              buildTextField(
                                  confirmpassController,
                                  IconlyLight.lock,
                                  "Confirm Password",
                                  true,
                                  false),
                              InkWell(
                                onTap: (() {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Timer(Duration(seconds: 3), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Otp_Screen()));

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
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
