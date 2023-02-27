import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';
import 'package:registrar_general_prototype/utils/constants.dart';
import 'package:registrar_general_prototype/widgets/buildActivityTile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../apis/payment_api.dart';
import '../../widgets/authWidget.dart';
import '../../widgets/nameSearch_widget.dart';

class Business_Search_Screen extends StatefulWidget {
  const Business_Search_Screen({super.key});

  @override
  State<Business_Search_Screen> createState() => _Business_Search_ScreenState();
}

class _Business_Search_ScreenState extends State<Business_Search_Screen> {
  TextEditingController _searchController = TextEditingController();
  final emailController = TextEditingController();
  bool isNotfound = false;
  bool isresLoading = false;
  bool isreLoading = false;
  bool isInfoPreview = false;
  bool isInfoclicked = false;
  Timer? _debounce;
  List<String> _searchResults = [];
  String _searchText = '';
  List<String> strings = [
    "Mary's Fashion",
    'TesMa Multimedia',
    'Bee Bakery',
    'TesMema Group',
    'PBlessing Automobiles',
  ];

  void _startSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        var data = strings.where((item) => item.contains(query)).toList();
        _searchResults = data;
        if (_searchResults.isEmpty) {
          setState(() {
            isNotfound = true;
          });
        }
      });
    });
  }

  List<String> get _filteredStrings {
    if (_searchText.isEmpty) {
      return strings;
    }

    return strings
        .where((string) =>
            string.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
  }

  final TextEditingController _search_Controller = TextEditingController();
  String? _selectedName;
  bool _nameExists = false;
  final _formKey = GlobalKey<FormState>();

  void _searchForName() {
    setState(() {
      _nameExists = strings.contains(_search_Controller.text);
      if (!_nameExists) {
        _selectedName = _search_Controller.text;
      }
    });
  }

  void _reserveName(String name) {
    strings.add(name);
    setState(() {
      _selectedName = null;
      _nameExists = true;
    });
  }

  bool isEntity = false;
  bool isReservation = false;

  bool isLoading = false;

  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void dispose() {
    _focusNode.dispose();
    _search_Controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: FocusScope(
        autofocus: true,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: _height <= 820 ? _height / 2.6 : _height / 3,
                width: _width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/buss.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => MainPage())));
                              },
                              icon: const Icon(
                                CupertinoIcons.clear_circled_solid,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 8),
                        child: Text(
                          "Business Entity Info Search",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Poppins-Light',
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          focusNode: _focusNode,
                          onTap: () {
                            setState(() {
                              _isFocused = true;
                            });
                          },
                          controller: _searchController,
                          // onChanged: (value) {
                          //   setState(() {
                          //     _searchText = value;
                          //   });
                          // },
                          onFieldSubmitted: (value) {
                            _startSearch(value);
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            contentPadding: EdgeInsets.all(15),
                            hintText: "Search for a business status",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Poppins-Light'),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isLoading = true;
                                });
                                _startSearch(_searchController.text);
                                Timer(Duration(seconds: 2), () {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: isLoading
                                    ? SpinKitRipple(
                                        color: GlobalVars.kPrimary,
                                        size: 20,
                                      )
                                    : Icon(IconlyLight.search,
                                        color: GlobalVars.kPrimary),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 270,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(30),
                  height: _height,
                  width: _width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: isresLoading
                      ? SpinKitRipple(
                          color: GlobalVars.kPrimary,
                          size: 30,
                        )
                      : isNotfound
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Center(
                                  child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isNotfound = false;
                                          });
                                        },
                                        icon: const Icon(
                                          CupertinoIcons.clear_circled_solid,
                                          size: 24,
                                          color: GlobalVars.kPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Lottie.asset(
                                    "assets/lotties/searchnot.json",
                                    height: 150,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Name not found',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                            )
                          : _isFocused
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 15.0),
                                          child: Text(
                                            "Search  Results",
                                            style: GlobalVars.kMediumStyle,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isFocused = false;
                                            });
                                          },
                                          icon: Icon(
                                            CupertinoIcons.clear_circled_solid,
                                            size: 24,
                                            color: GlobalVars.kPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Request for entity info by clicking on searched entity',
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    isInfoPreview
                                        ? isInfoclicked
                                            ? Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Text(
                                                      "Provide email to receive report when ready:",
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    buildTextField(
                                                        emailController,
                                                        IconlyLight.message,
                                                        "Provide your email",
                                                        false,
                                                        true),
                                                    Center(
                                                        child: Column(
                                                            children: [
                                                          TextButton(
                                                            onPressed: (() {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (ctx) {
                                                                    return CupertinoAlertDialog(
                                                                      title:
                                                                          Text(
                                                                        "Do you want to make payment?",
                                                                      ),
                                                                      actions: [
                                                                        CupertinoDialogAction(
                                                                          child:
                                                                              Text(
                                                                            "cancel",
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                        CupertinoDialogAction(
                                                                          child:
                                                                              Text(
                                                                            "Yes",
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              isresLoading = true;
                                                                            });
                                                                            Payment.getPaymentResponse(context).then((value) {
                                                                              setState(() {
                                                                                isresLoading = false;
                                                                              });
                                                                            });
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  });
                                                            }),
                                                            child: Container(
                                                              height: 40,
                                                              width: 250,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: GlobalVars
                                                                    .kPrimary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Make Payment',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: (() {
                                                              setState(() {
                                                                isInfoclicked =
                                                                    false;
                                                              });
                                                            }),
                                                            child: Container(
                                                              height: 40,
                                                              width: 250,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .redAccent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Cancel',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ]))
                                                  ],
                                                ),
                                              )
                                            : Center(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            isInfoclicked =
                                                                true;
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 40,
                                                          width: 250,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: GlobalVars
                                                                .kPrimary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'Get all info',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: (() {}),
                                                        child: Container(
                                                          height: 40,
                                                          width: 250,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: GlobalVars
                                                                .kPrimary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'Officers Info',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: (() {}),
                                                        child: Container(
                                                          height: 40,
                                                          width: 250,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: GlobalVars
                                                                .kPrimary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'Share Holders Info',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: (() {}),
                                                        child: Container(
                                                          height: 40,
                                                          width: 250,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: GlobalVars
                                                                .kPrimary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'Beneficial owners info',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: (() {
                                                          setState(() {
                                                            isInfoPreview =
                                                                false;
                                                          });
                                                        }),
                                                        child: Container(
                                                          height: 40,
                                                          width: 250,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .redAccent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                              )
                                        : isLoading
                                            ? Center(
                                                child: SpinKitRipple(
                                                  color: GlobalVars.kPrimary,
                                                  size: 55,
                                                ),
                                              )
                                            : SizedBox(
                                                height: _height / 2,
                                                child: ListView.builder(
                                                  padding: EdgeInsets.only(
                                                      bottom: 40),
                                                  itemCount:
                                                      _searchResults.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 12),
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isInfoPreview =
                                                                  true;
                                                            });
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20),
                                                            height: 100,
                                                            width: _width,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: GlobalVars
                                                                  .kPrimary
                                                                  .withOpacity(
                                                                      0.15),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 33,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  child: Icon(
                                                                    IconlyLight
                                                                        .work,
                                                                    size: 33,
                                                                    color: GlobalVars
                                                                        .kPrimary,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        _searchResults[
                                                                            index],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontFamily:
                                                                                'Poppins-SemiBold',
                                                                            color:
                                                                                GlobalVars.kPrimary),
                                                                      ),
                                                                      Text(
                                                                        "type: Sole Proprietor",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontFamily:
                                                                                'Poppins-Regular'),
                                                                      ),
                                                                      Text(
                                                                        "status: Liquidated",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontFamily:
                                                                                'Poppins-Regular'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ]);
                                                  },
                                                ),
                                              ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    isReservation
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Lottie.asset(
                                                "assets/lotties/search.json",
                                                height: 150,
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Text(
                                                "No business search  yet",
                                                style: GlobalVars.kMediumStyle,
                                              ),
                                            ],
                                          )
                                        : isEntity
                                            ? Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 15.0),
                                                    child: Text(
                                                      "Entity Search",
                                                      style: GlobalVars
                                                          .kMediumStyle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Lottie.asset(
                                                    "assets/lotties/search.json",
                                                    height: 150,
                                                  ),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  TextFormField(
                                                    style: TextStyle(
                                                      color:
                                                          GlobalVars.kPrimary,
                                                    ),
                                                    decoration: InputDecoration(
                                                      suffixIcon: Icon(
                                                        IconlyLight.search,
                                                        color:
                                                            GlobalVars.kPrimary,
                                                      ),
                                                      fillColor: Colors.grey,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: GlobalVars
                                                              .kPrimary,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .greenAccent,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25)),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsets.all(15),
                                                      hintText:
                                                          "Search for an entity",
                                                      hintStyle: TextStyle(
                                                          fontSize: 14,
                                                          color: GlobalVars
                                                              .kPrimary,
                                                          fontFamily:
                                                              'Poppins-Light'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 60,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        isEntity = false;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            GlobalVars.kPrimary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 80),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Lottie.asset(
                                                        "assets/lotties/search.json",
                                                        height: 150,
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      Text(
                                                        "No business search made",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                  ],
                                ),
                ))
          ],
        ),
      ),
    );
  }
}
