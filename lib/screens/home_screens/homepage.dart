import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/screens/home_screens/business_entity_search.dart';
import 'package:registrar_general_prototype/screens/home_screens/category_details/changeParticulars.dart';
import 'package:registrar_general_prototype/screens/home_screens/category_details/entryCreation.dart';
import 'package:registrar_general_prototype/screens/home_screens/contact_page.dart';
import 'package:registrar_general_prototype/screens/home_screens/notifications_page.dart';
import 'package:registrar_general_prototype/screens/home_screens/periodic_filing_page.dart';
import 'package:registrar_general_prototype/screens/home_screens/search_screen.dart';
import 'package:registrar_general_prototype/screens/home_screens/tabView_details/application_status.dart';
import 'package:registrar_general_prototype/screens/home_screens/tabView_details/approvals_page.dart';
import 'package:registrar_general_prototype/screens/home_screens/tabView_details/payments_screen.dart';
import 'package:registrar_general_prototype/screens/onBoarding_page/search_screen.dart';
import 'package:registrar_general_prototype/utils/constants.dart';
import 'package:registrar_general_prototype/widgets/buildActivityTile.dart';
import 'package:registrar_general_prototype/widgets/drawer_screen.dart';
import 'package:registrar_general_prototype/widgets/nameSearch_widget.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Homepage extends StatefulWidget {
  static String id = 'homepage';
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  bool menuOpen = false;
  double tranx = 0, transy = 0, scale = 1;
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

  final List<String> _menuList = [
    'Annual Renewal',
    'Annual Returns',
  ];

  final List<IconData> _menuIcons = [
    IconlyLight.swap,
    IconlyLight.time_circle,
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

  final List<String> _conversionList = [
    "Conversion of a company \nlimited by shares to a \ncompany limited by guarantee",
    "Conversion of an unlimited \nliability company to a company\n limited by guarantee",
    "Conversion of a private\n comapny limited by shares\n to an unlimited private company"
        "Conversion of a private\n limited by shares to a\n public limited company",
    "Conversion of a private\n limited by shares to\n unlimited public company",
    "Conversion of a private\n unlimited by shares\n to unlimited public company",
    "Conversion of a private\n unlimited by shares\n to limited public company",
    "Conversion of a private\n partnership to a limited\n liability company",
    "Conversion of a private\n partnership to a private\n unlimited liability company",
    "Conversion of a private\n partnership to a public\n limited company",
    "Conversion of a sole\n proprietorship to a private\n limited company",
    "Conversion of a sole\n proprietorship to a private\n unlimited liability company",
    "Conversion of a sole\n proprietorship to a private\n partnership",
    "Conversion of a sole\n proprietorship to a public \nlimited company",
    "Conversion of a sole\n proprietorship to a public \nunlimited company",
    "Conversion of a sole\n proprietorship to a public \nlimited company",
  ];
  final List<String> _particularsList = [
    'Change of name of\na Company',
    'Change of name of\na Sole proprietorship',
    'Change of name of\nan External(foreign company)',
    'Change of name of\na Private Partnership',
    'Change of name of\na Profession body',
    'Change of name of\na Subsidiary Name',
  ];

  late TabController _tabController;

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  int bottomTab = 0;

  bool isUncompleted = false;

  bool isPending = false;

  var key;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy hh:mm:ss');
    String formattedDate = formatter.format(now);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer_Screen(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: _height <= 820 ? WaveClipperOne() : WaveClipperTwo(),
              child: Container(
                  height: _height <= 820 ? _height / 3.5 : _height / 4,
                  width: _width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: _height <= 820 ? 30 : 40.0, left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: IconButton(
                                    onPressed: () {
                                      _scaffoldKey.currentState!.openDrawer();
                                      _scaffoldKey.currentState!
                                          .openEndDrawer();
                                    },
                                    icon: Icon(
                                      IconlyLight.filter,
                                      color: GlobalVars.kPrimary,
                                      size: 18,
                                    )),
                              ),
                              Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Notifications(),
                                          ));
                                    },
                                    icon: Icon(
                                      IconlyLight.notification,
                                      color: GlobalVars.kPrimary,
                                      size: 18,
                                    )),
                              ),
                            ],
                          ),
                          Center(
                            child: Image.asset(
                              "assets/pngs/orclogo.png",
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: _height <= 820 ? 210 : 215,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(),
              height: _height,
              width: _width,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Welcome Back, Mary",
                          style: TextStyle(
                              fontFamily: 'Poppins-Regular', fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          thickness: 0.2,
                          color: GlobalVars.kPrimary,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Services",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins-Bold',
                                  letterSpacing: 1),
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: SizedBox(
                          height: _height / 1.5,
                          child: GridView.count(
                            padding: EdgeInsets.only(
                              bottom: 10,
                            ),
                            shrinkWrap: false,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: _height <= 820 ? 1.4 : 1.3,
                            scrollDirection: Axis.vertical,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 20,
                            children: [
                              DashGridCards(
                                deviceHeight: _height,
                                deviceWidth: _width,
                                title: 'Name Search',
                                iconData: IconlyLight.search,
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Login_Search_Screen())));
                                },
                              ),
                              DashGridCards(
                                deviceHeight: _height,
                                deviceWidth: _width,
                                title: 'Business Entity\nInformation Search',
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Business_Search_Screen())));
                                },
                                iconData: IconlyLight.scan,
                              ),
                              DashGridCards(
                                deviceHeight: _height,
                                deviceWidth: _width,
                                title: 'Name Reservation',
                                iconData: IconlyLight.arrow_down,
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Search_Screen())));
                                },
                              ),
                              DashGridCards(
                                deviceHeight: _height,
                                deviceWidth: _width,
                                title: 'Entity Creation',
                                iconData: IconlyLight.edit,
                                press: (() {
                                  showAlert(context, 'Entity Creation');
                                }),
                              ),
                              DashGridCards(
                                deviceHeight: _height,
                                deviceWidth: _width,
                                title: 'Change of Particulars',
                                iconData: Icons.change_circle_outlined,
                                press: () {
                                  showParticularsAlert(context);
                                },
                              ),
                              DashGridCards(
                                deviceHeight: _height,
                                deviceWidth: _width,
                                title: 'Periodic Filings',
                                iconData: IconlyLight.document,
                                press: () {
                                  showMenuAlert(context, 'Periodic Filing');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      // isPending
                      //     ? Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.only(left: 15.0),
                      //             child: Text(
                      //               "Pending Approvals",
                      //               style: TextStyle(
                      //                   fontSize: 14,
                      //                   fontFamily: 'Poppins-Regular',
                      //                   letterSpacing: 1),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: MediaQuery.of(context).size.width,
                      //             height: 500,
                      //             child: SingleChildScrollView(
                      //               child: DataTable(
                      //                 columns: [
                      //                   DataColumn(label: tableRowText('#ID')),
                      //                   DataColumn(
                      //                       label: tableRowText('Description')),
                      //                   DataColumn(
                      //                       label: tableRowText('STATUS')),
                      //                 ],
                      //                 rows: [
                      //                   DataRow(cells: [
                      //                     DataCell(tableColText('#1')),
                      //                     DataCell(tableColText(
                      //                         'Change of Business\nName for tesma Auto')),
                      //                     DataCell(tableColStatusText(
                      //                         'Continue', Colors.green.shade600,
                      //                         () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) =>
                      //             Registration_Page())));
                      //                     })),
                      //                   ]),
                      //                   DataRow(cells: [
                      //                     DataCell(tableColText('#2')),
                      //                     DataCell(tableColText(
                      //                         "Change registered office\nfor bee's bakery")),
                      //                     DataCell(tableColStatusText(
                      //                         'Continue', Colors.green.shade600,
                      //                         () {
                      //                       Navigator.push(
                      //                           context,
                      //                           MaterialPageRoute(
                      //                               builder: ((context) =>
                      //                                   Registration_Page())));
                      //                     })),
                      //                   ]),
                      //                   DataRow(cells: [
                      //                     DataCell(tableColText('#3')),
                      //                     DataCell(tableColText(
                      //                         "Annual filling for\nTesma multimedia")),
                      //                     DataCell(tableColStatusText(
                      //                         'Continue', Colors.green.shade600,
                      //                         () {
                      //                       Navigator.push(
                      //                           context,
                      //                           MaterialPageRoute(
                      //                               builder: ((context) =>
                      //                                   Registration_Page())));
                      //                     })),
                      //                   ]),
                      //                   DataRow(cells: [
                      //                     DataCell(tableColText('#4')),
                      //                     DataCell(tableColText(
                      //                         'Inncorporation of public\nlimited by guarante')),
                      //                     DataCell(tableColStatusText(
                      //                         'Continue', Colors.green.shade600,
                      //                         () {
                      //                       Navigator.push(
                      //                           context,
                      //                           MaterialPageRoute(
                      //                               builder: ((context) =>
                      //                                   Registration_Page())));
                      //                     })),
                      //                   ]),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       )
                      //     : isUncompleted
                      //         ? Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Padding(
                      //                 padding:
                      //                     const EdgeInsets.only(left: 15.0),
                      //                 child: Text(
                      //                   "Uncompleted Application",
                      //                   style: TextStyle(
                      //                       fontSize: 14,
                      //                       fontFamily: 'Poppins-Regular',
                      //                       letterSpacing: 1),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 width: MediaQuery.of(context).size.width,
                      //                 height: 500,
                      //                 child: SingleChildScrollView(
                      //                   child: DataTable(
                      //                     columns: [
                      //                       DataColumn(
                      //                           label: tableRowText('#ID')),
                      //                       DataColumn(
                      //                           label: tableRowText(
                      //                               'Description')),
                      //                       DataColumn(
                      //                           label: tableRowText('STATUS')),
                      //                     ],
                      //                     rows: [
                      //                       DataRow(cells: [
                      //                         DataCell(tableColText('#1')),
                      //                         DataCell(tableColText(
                      //                             'Change of Business\nName for tesma Auto')),
                      //                         DataCell(tableColStatusText(
                      //                             'Continue',
                      //                             Colors.green.shade600, () {
                      //                           Navigator.push(
                      //                               context,
                      //                               MaterialPageRoute(
                      //                                   builder: ((context) =>
                      //                                       Registration_Page())));
                      //                         })),
                      //                       ]),
                      //                       DataRow(cells: [
                      //                         DataCell(tableColText('#2')),
                      //                         DataCell(tableColText(
                      //                             "Change registered office\nfor bee's bakery")),
                      //                         DataCell(tableColStatusText(
                      //                             'Continue',
                      //                             Colors.green.shade600, () {
                      //                           Navigator.push(
                      //                               context,
                      //                               MaterialPageRoute(
                      //                                   builder: ((context) =>
                      //                                       Registration_Page())));
                      //                         })),
                      //                       ]),
                      //                       DataRow(cells: [
                      //                         DataCell(tableColText('#3')),
                      //                         DataCell(tableColText(
                      //                             "Annual filling for\nTesma multimedia")),
                      //                         DataCell(tableColStatusText(
                      //                             'Continue',
                      //                             Colors.green.shade600, () {
                      //                           Navigator.push(
                      //                               context,
                      //                               MaterialPageRoute(
                      //                                   builder: ((context) =>
                      //                                       Registration_Page())));
                      //                         })),
                      //                       ]),
                      //                       DataRow(cells: [
                      //                         DataCell(tableColText('#4')),
                      //                         DataCell(tableColText(
                      //                             'Inncorporation of public\nlimited by guarante')),
                      //                         DataCell(tableColStatusText(
                      //                             'Continue',
                      //                             Colors.green.shade600, () {
                      //                           Navigator.push(
                      //                               context,
                      //                               MaterialPageRoute(
                      //                                   builder: ((context) =>
                      //                                       Registration_Page())));
                      //                         })),
                      //                       ]),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           )
                      //         : Center(
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(
                      //                 top: 25,
                      //               ),
                      //               child: TabBar(
                      //                 indicatorSize: TabBarIndicatorSize.tab,
                      //                 indicatorColor: GlobalVars.kPrimary,
                      //                 onTap: (newIndex) {
                      //                   print(newIndex);
                      //                   setState(() {
                      //                     currentIndex = newIndex;
                      //                   });
                      //                 },
                      //                 unselectedLabelStyle: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 14,
                      //                   fontFamily: 'Poppins-Regular',
                      //                 ),
                      //                 labelStyle: TextStyle(
                      //                     fontSize: 16,
                      //                     color: Colors.blueGrey,
                      //                     fontFamily: 'Poppins-Regular'),
                      //                 isScrollable: true,
                      //                 labelColor: GlobalVars.kPrimary,
                      //                 unselectedLabelColor: GlobalVars.kPrimary,
                      //                 controller: _tabController,
                      //                 tabs: [
                      //                   Tab(
                      //                     text: "Application status",
                      //                   ),
                      //                   Tab(
                      //                     text: "Approvals",
                      //                   ),
                      //                   Tab(
                      //                     text: "Payments",
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 10),
                      //   height: _height,
                      //   child: TabBarView(
                      //     children: [
                      //       Application_Status(),
                      //       Approvals_Screen(),
                      //       Payment_Screen(),
                      //     ],
                      //     controller: _tabController,
                      //   ),
                      // ),
                      // Activity_Dashboard(_height, context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView dashboard_cards(double _height, double _width) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          InkWell(
            onTap: (() {
              setState(() {
                isUncompleted = true;
              });
            }),
            child: Container(
              padding: EdgeInsets.all(_height < 820 ? 10 : 15),
              height: _height / 7.5,
              width: _width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/pngs/Hexagon.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Icon(
                        IconlyLight.work,
                        color: GlobalVars.kPrimary,
                        size: 30,
                      )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "10",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _height < 820 ? 30 : 38,
                              fontFamily: 'Poppins-Bold'),
                        ),
                        Text(
                          "Uncompleted \nApplication",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _height < 820 ? 8 : 10,
                              fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                isPending = true;
              });
            },
            child: Container(
              padding: EdgeInsets.all(_height < 820 ? 10 : 15),
              height: _height / 7.5,
              width: _width / 1.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/pngs/pol.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        IconlyLight.swap,
                        color: GlobalVars.kPrimary,
                        size: 30,
                      )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "20",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _height < 820 ? 30 : 38,
                              fontFamily: 'Poppins-Bold'),
                        ),
                        Text(
                          "Pending\nApprovals",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _height < 820 ? 10 : 12,
                              fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.all(_height < 820 ? 10 : 15),
            height: _height / 7.5,
            width: _width / 1.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/pngs/stock.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                        child: Icon(
                      CupertinoIcons.money_dollar_circle_fill,
                      color: GlobalVars.kPrimary,
                      size: 30,
                    )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "GHC 200",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: _height <= 820 ? 18 : 22,
                            fontFamily: 'Poppins-Bold'),
                      ),
                      Text(
                        "Pending Payment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: _height <= 820 ? 10 : 12,
                            fontFamily: 'Poppins-Regular'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox Activity_Dashboard(double _height, BuildContext context) {
    return SizedBox(
      height: _height / 1.9,
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildActivityTile(
                context,
                "Search and Name Res",
                "Do you know you must register \nyour business if you're trading \nunder a business name?",
                IconlyBroken.search, () {
              showSearch(context: context, delegate: CustomSearch());
            }),
            SizedBox(
              height: 20,
            ),
            buildActivityTile(
                context,
                "Conversion of Business",
                "Do you know you must register \nyour business if you're trading \nunder a business name?",
                IconlyLight.paper, () {
              showConversionsAlert(
                context,
              );
            }),
            SizedBox(
              height: 20,
            ),
            buildActivityTile(
                context,
                "Entity Creation",
                "Do you know you must register \nyour business if you're trading \nunder a business name?",
                IconlyLight.edit_square, () {
              showAlert(
                context,
                "Entity Creation",
              );
            }),
            SizedBox(
              height: 20,
            ),
            buildActivityTile(
                context,
                "Change of Particulars",
                "Do you know you must register \nyour business if you're trading \nunder a business name?",
                IconlyBold.document, () {
              showParticularsAlert(
                context,
              );
            }),
            SizedBox(
              height: 20,
            ),
            buildActivityTile(
                context,
                "Debentures and Charges",
                "Do you know you must register \nyour business if you're trading \nunder a business name?",
                CupertinoIcons.money_dollar, () {
              showdebenturesAlert(
                context,
                "Debentures and Charges",
              );
            }),
            SizedBox(
              height: 20,
            ),
            buildActivityTile(
                context,
                "Periodic Filling",
                "Do you know you must register \nyour business if you're trading \nunder a business name?",
                IconlyLight.document, () {
              showAlert(
                context,
                "Periodic Filling",
              );
            }),
            SizedBox(
              height: 20,
            ),
            buildActivityTile(
                context,
                "Dissolution and Restoration",
                "Do you know you must register \nyour business if you're trading \nunder a business name?",
                Icons.update, () {
              showAlert(
                context,
                "Dissolution and Restoration",
              );
            }),
            SizedBox(
              height: 20,
            ),
            buildActivityTile(
                context,
                "Access Info",
                "Do you know you must register \nyour business if you're trading \nunder a business name?",
                IconlyLight.info_circle, () {
              showAlert(
                context,
                "Access Info",
              );
            }),
            SizedBox(
              height: 20,
            ),
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
                height: _height * 0.63,
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
                      SizedBox(
                        height: _height / 1.8,
                        child: ListView.separated(
                            itemCount: _entityList.length,
                            shrinkWrap: true,
                            separatorBuilder:
                                (BuildContext context, int index) =>
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
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  void showMenuAlert(
    BuildContext context,
    String title,
  ) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => Stack(children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                content: Container(
                  height: _height * 0.25,
                  width: _width,
                  padding: EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: "Poppins-Bold",
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: _height / 1.8,
                          child: ListView.separated(
                              itemCount: _menuList.length,
                              shrinkWrap: true,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(
                                    _menuIcons[index],
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
                                              Periodic_Filing_Screen(
                                                pageTitle: _menuList[index],
                                              ))),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 210,
                left: 0,
                right: 0,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/pngs/COA.png",
                    scale: 14,
                  ),
                ),
              ),
            ]));
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

  void showConversionsAlert(
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
                          itemCount: _conversionList.length,
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
                                _conversionList[index],
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
}

class DashGridCards extends StatelessWidget {
  const DashGridCards({
    Key? key,
    required double deviceHeight,
    required double deviceWidth,
    this.press,
    this.iconData,
    this.title,
  })  : _deviceHeight = deviceHeight,
        _deviceWidth = deviceWidth,
        super(key: key);

  final double _deviceHeight;
  final double _deviceWidth;
  final VoidCallback? press;
  final IconData? iconData;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(top: 15),
        height: _deviceHeight / 8,
        width: _deviceWidth / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage('assets/pngs/Hexagon.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
                    height: _deviceHeight <= 820 ? 50 : 60,
                    width: _deviceHeight <= 820 ? 50 : 60,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Icon(
                      iconData,
                      size: _deviceHeight <= 820 ? 24 : 26,
                    ))),
            SizedBox(
              height: 10,
            ),
            Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: _deviceHeight <= 820 ? 10 : 13,
                  fontFamily: 'Poppins-Medium',
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
