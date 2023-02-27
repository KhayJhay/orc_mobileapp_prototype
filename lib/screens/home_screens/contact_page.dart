import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';

import '../../utils/constants.dart';
import '../../widgets/buildActivityTile.dart';
import 'category_details/changeParticulars.dart';
import 'category_details/entryCreation.dart';

class Registration_Page extends StatefulWidget {
  const Registration_Page({super.key});

  @override
  State<Registration_Page> createState() => _Registration_PageState();
}

class _Registration_PageState extends State<Registration_Page> {
  String _searchText = '';

  List<String> strings = [
    "Mary's Fashion",
    'TesMa Multimedia',
    'Bee Bakery',
    'TesMema Group',
    'PBlessing Automobiles',
  ];

  List<String> get _filteredStrings {
    if (_searchText.isEmpty) {
      return strings;
    }

    return strings
        .where((string) =>
            string.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
  }

  bool isEntity = false;
  bool isReservation = false;

  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final List<String> _entityList = [
    'Incorporation of a private\ncompany limited by shares',
    'Incorporation of a public\ncompany limited by shares',
    'Incorporation of a private\ncompany unlimited by shares',
    'Incorporation of a private\ncompany limited by guarantee',
    'Incorporation of a public\ncompany limited by guarantee',
    'Incorporation of an unlimited\npublic company',
    'Incorporation of a private\npartnership',
    'Incorporation of a professional\nbody',
    'Registration of an external\n(foreign company)',
    'Process of reregistration  of\nsole proprietor',
    'Registration of a subsidiary',
  ];

  final List<String> _debenturesList = [
    'Register debentures and charges\n for a company',
    'Register debentures and charges\n for a private partnership',
    'Register debentures and charges\n for a company',
    'Modification of debentures and\ncharges for a company',
    'Modification of debentures and\ncharges for a private partnership'
        'Discharge of debentures and\ncharges for a company',
    'Discharge of debentures and\ncharges for a private partnership',
  ];

  final List<String> _menuList = [
    "File Renewal",
    "Change Name",
    "Change Registered Office",
    "Conversions",
    "Transfer of Ownership",
    "Cancellation of Sole Proprietorship"
  ];
  final List<String> _particularsList = [
    'Change of name of\na Company',
    'Change of name of\na Sole proprietorship',
    'Change of name of\nan External(foreign company)',
    'Change of name of\na Private Partnership',
    'Change of name of\na Profession body',
    'Change of name of\na Subsidiary Name',
  ];

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/regist.jpg'),
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
                              icon: Icon(
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
                          "Registered Entity Search",
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
                          onChanged: (value) {
                            setState(() {
                              _searchText = value;
                            });
                          },
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              IconlyLight.search,
                              color: Colors.white,
                            ),
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
                            hintText: "Search for an entity",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Poppins-Light'),
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: _isFocused
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    "Your Registered Businesses",
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
                            SizedBox(
                              height: _height / 2,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 20),
                                itemCount: _filteredStrings.length,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 12),
                                      child: InkWell(
                                        onTap: () {
                                          showActionAlert(context, "");
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          height: 100,
                                          width: _width,
                                          decoration: BoxDecoration(
                                            color: GlobalVars.kPrimary
                                                .withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 33,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  IconlyLight.work,
                                                  size: 33,
                                                  color: GlobalVars.kPrimary,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _filteredStrings[index],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'Poppins-SemiBold',
                                                          color: GlobalVars
                                                              .kPrimary),
                                                    ),
                                                    Text(
                                                      "Sole Proprietor",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'Poppins-Regular'),
                                                    ),
                                                    Text(
                                                      "Reg#: 24452332576",
                                                      style: TextStyle(
                                                          fontSize: 12,
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                "Registered Entites",
                                style: GlobalVars.kMediumStyle,
                              ),
                            ),
                            SizedBox(
                              height: _height <= 820
                                  ? _height / 2.1
                                  : _height / 1.8,
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  buildEntityTile(
                                      context,
                                      "Mary's Fashion",
                                      "Do you know you must register \nyour business if you're trading \nunder a business name?",
                                      IconlyLight.work, () {
                                    showActionAlert(
                                      context,
                                      "Mary's Fashion",
                                    );
                                  }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  buildEntityTile(
                                      context,
                                      "TesMa Multimedia",
                                      "Do you know you must register \nyour business if you're trading \nunder a business name?",
                                      IconlyLight.work, () {
                                    showActionAlert(
                                      context,
                                      "TesMa Multimedia",
                                    );
                                  }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  buildEntityTile(
                                      context,
                                      "Bee Bakery",
                                      "Do you know you must register \nyour business if you're trading \nunder a business name?",
                                      IconlyLight.work, () {
                                    showActionAlert(
                                      context,
                                      "Bee Bakery",
                                    );
                                  }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  buildEntityTile(
                                      context,
                                      "TesMeMa Group",
                                      "Do you know you must register \nyour business if you're trading \nunder a business name?",
                                      IconlyLight.work, () {
                                    showActionAlert(
                                      context,
                                      "TesMeMa Group",
                                    );
                                  }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  buildEntityTile(
                                      context,
                                      "PBlessing AutoMobiles",
                                      "Do you know you must register \nyour business if you're trading \nunder a business name?",
                                      IconlyLight.work, () {
                                    showActionAlert(
                                      context,
                                      "PBlessing AutoMobiles",
                                    );
                                  }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ]),
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

  void showAlert(
    BuildContext context,
    String title,
  ) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                height: _height * 0.58,
                width: _width,
                padding: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyBold.category,
                            color: GlobalVars.kPrimary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                          itemCount: _entityList.length,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(
                                IconlyBold.info_circle,
                                color: GlobalVars.kPrimary,
                              ),
                              title: Text(
                                _entityList[index],
                                style: TextStyle(
                                  fontFamily: "Poppins-Regular",
                                  fontSize: 12,
                                ),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EntryCreationDetails(
                                            pageTitle: _entityList[index],
                                          ))),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ));
  }

  void showdebenturesAlert(
    BuildContext context,
    String title,
  ) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                height: _height * 0.58,
                width: _width,
                padding: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyBold.category,
                            color: GlobalVars.kPrimary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                          itemCount: _debenturesList.length,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(
                                IconlyBold.info_circle,
                                color: GlobalVars.kPrimary,
                              ),
                              title: Text(
                                _debenturesList[index],
                                style: TextStyle(
                                  fontFamily: "Poppins-Regular",
                                  fontSize: 12,
                                ),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EntryCreationDetails(
                                            pageTitle: _entityList[index],
                                          ))),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ));
  }

  void showParticularsAlert(
    BuildContext context,
  ) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                height: _height * 0.56,
                width: _width,
                padding: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyBold.category,
                            color: GlobalVars.kPrimary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Select a sub-category",
                            style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                          itemCount: _particularsList.length,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(
                                IconlyBold.info_circle,
                                color: GlobalVars.kPrimary,
                              ),
                              title: Text(
                                _particularsList[index],
                                style: TextStyle(
                                  fontFamily: "Poppins-Regular",
                                  fontSize: 12,
                                ),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeParticularsDetails(
                                            pageTitle: _particularsList[index],
                                          ))),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ));
  }

  void showActionAlert(
    BuildContext context,
    String bname,
  ) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                height: _height * 0.56,
                width: _width,
                padding: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconlyBold.bag_2,
                              color: GlobalVars.kPrimary,
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sole Proprietorship",
                                  style: TextStyle(
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.clear_circled_solid,
                                    size: 24,
                                    color: GlobalVars.kPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        bname,
                        style: TextStyle(
                          fontFamily: "Poppins-Regular",
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.separated(
                          itemCount: _menuList.length,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(
                                IconlyBold.info_circle,
                                color: GlobalVars.kPrimary,
                              ),
                              title: Text(
                                _menuList[index],
                                style: TextStyle(
                                  fontFamily: "Poppins-Regular",
                                  fontSize: 12,
                                ),
                              ),
                              trailing: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeParticularsDetails(
                                            pageTitle: _menuList[index],
                                          ))),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ));
  }
}
