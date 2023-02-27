import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/screens/authentication_screens/register_screen.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:registrar_general_prototype/widgets/layout_screen.dart';
import '../../utils/constants.dart';
import '../../widgets/authWidget.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final keyForm = GlobalKey<FormState>();
  bool isRememberme = false;
  bool isLoading = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();
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
                    height: _height <= 820 ? _height / 1.75 : _height / 2.0,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    IconlyBold.lock,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Login in to your  account",
                                    style: GlobalVars.kMediumStyle,
                                  )
                                ],
                              ),
                            ),
                            buildTextField(emailController, IconlyLight.message,
                                "Email", false, true),
                            buildTextField(passController, IconlyLight.lock,
                                "Enter Password", true, false),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: isRememberme,
                                        onChanged: (value) {
                                          setState(() {
                                            isRememberme = !isRememberme;
                                          });
                                        }),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: GlobalVars.kSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: GlobalVars.kPrimary,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
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
                                      title: 'Login Success',
                                      message:
                                          'You have logged in successfully',

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
                                          builder: (context) =>
                                              LayoutScreen()));

                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              }),
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
                                          'LOGIN',
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
                                    "Don't have an account ?",
                                    style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      fontSize: 14,
                                      color: GlobalVars.kSecondary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Register",
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
