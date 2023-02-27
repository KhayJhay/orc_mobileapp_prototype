import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/apis/ghanacard_Validation_api.dart';
import 'package:registrar_general_prototype/screens/authentication_screens/loginscreen.dart';
import 'package:registrar_general_prototype/screens/authentication_screens/register_screen.dart';
import 'package:registrar_general_prototype/screens/onBoarding_page/search_screen.dart';
import 'package:registrar_general_prototype/utils/constants.dart';

import '../../widgets/authWidget.dart';

class GetStarted_Page extends StatefulWidget {
  const GetStarted_Page({Key? key}) : super(key: key);

  @override
  State<GetStarted_Page> createState() => _GetStarted_PageState();
}

class _GetStarted_PageState extends State<GetStarted_Page> {
  final ghanaCardController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          color: Colors.white.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: _height <= 820 ? 180 : 230),
                child: Column(
                  children: [
                    // Image.asset(
                    //   "assets/pngs/COA.png",
                    //   height: 70,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/pngs/orclogo.png",
                            height: 120,
                          ),
                          Container(
                            height: 66,
                            width: 2.8,
                            color: GlobalVars.kTertiary,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Image.asset(
                            "assets/pngs/COA.png",
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "OFFICE OF THE REGISTRAR \n OF COMPANIES",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Search_Screen()));
                      }),
                      child: Container(
                        height: _height <= 820 ? 52 : 60,
                        width: 280,
                        decoration: BoxDecoration(
                            color: GlobalVars.kPrimary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconlyLight.search,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Basic Name Search",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Page()));
                      }),
                      child: Container(
                        height: _height <= 820 ? 52 : 60,
                        width: 280,
                        decoration: BoxDecoration(
                            color: GlobalVars.kPrimary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: (() {
                        ghanaCardBottomSheet(context);
                      }),
                      child: Container(
                        height: _height <= 820 ? 52 : 60,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: isLoading
                              ? SpinKitPulse(
                                  size: 20,
                                  color: GlobalVars.kPrimary,
                                )
                              : Text(
                                  "Register",
                                  style: TextStyle(
                                      color: GlobalVars.kPrimary, fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void ghanaCardBottomSheet(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: _height / 3,
            width: _width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Register with ECOWAS Card',
                      style: GlobalVars.kSecTitleBblack,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter your card number',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        buildTextField(
                            ghanaCardController,
                            CupertinoIcons.creditcard,
                            "GHA-XXXXXXXXXXXXXXXXXXX-X",
                            false,
                            true),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          setState(() async {
                            final data =
                                await GhanaCard_Validation.getCardDetails(
                                    ghanaCardController.text);
                            Timer(Duration(seconds: 3), () {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      Register_Screen(data_model: data),
                                ),
                              );
                            });
                          });
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: _height <= 820 ? 52 : 60,
                        width: 280,
                        decoration: BoxDecoration(
                            color: GlobalVars.kPrimary,
                            borderRadius: BorderRadius.circular(20)),
                        child: isLoading
                            ? SpinKitPulse(
                                size: 20,
                                color: Colors.white,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    IconlyLight.shield_done,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Validate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
