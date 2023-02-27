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
import '../../widgets/nameSearch_widget.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({super.key});

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  TextEditingController _searchController = TextEditingController();
  bool isNotfound = false;
  bool isresLoading = false;
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
                          "Name Reservation",
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
                            hintText: "Search and reserve a name",
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
                                  Text(
                                    " ${_searchController.text}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Lottie.asset(
                                    "assets/lotties/searchnot.json",
                                    height: 150,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'The entity name ${_searchController.text} is not\nfound, You can reserve the name below',
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) {
                                            return CupertinoAlertDialog(
                                              title: Text(
                                                "Do you want to reserve ${_searchController.text}?",
                                              ),
                                              actions: [
                                                CupertinoDialogAction(
                                                  child: Text(
                                                    "cancel",
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                CupertinoDialogAction(
                                                  child: Text(
                                                    "Make Payment",
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isresLoading = true;
                                                    });
                                                    Payment.getPaymentResponse(
                                                            context)
                                                        .then((value) {
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
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 220,
                                      decoration: BoxDecoration(
                                          color: GlobalVars.kPrimary,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          'Reserve name',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
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
                                    isLoading
                                        ? Center(
                                            child: SpinKitRipple(
                                              color: GlobalVars.kPrimary,
                                              size: 55,
                                            ),
                                          )
                                        : SizedBox(
                                            height: _height / 2,
                                            child: ListView.builder(
                                              padding:
                                                  EdgeInsets.only(bottom: 40),
                                              itemCount: _searchResults.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .cancel_outlined,
                                                            color: Colors.red,
                                                            size: 18,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                              'Sorry!, this entity name cannot be reserved'),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 12),
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
                                                                        30),
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
                                                                padding:
                                                                    const EdgeInsets
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
                                                                      "Sole Proprietor",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              'Poppins-Regular'),
                                                                    ),
                                                                    Text(
                                                                      "Reg#: 24452332576",
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
