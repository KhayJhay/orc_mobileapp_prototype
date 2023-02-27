import 'package:flutter/material.dart';
import 'package:registrar_general_prototype/screens/home_screens/contact_page.dart';
import 'package:registrar_general_prototype/screens/home_screens/homepage.dart';
import 'package:registrar_general_prototype/screens/home_screens/notifications_page.dart';
import 'package:registrar_general_prototype/screens/home_screens/search_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/screens/home_screens/settings_page.dart';
import 'package:registrar_general_prototype/utils/constants.dart';

import 'category_details/entryCreation.dart';

class MainPage extends StatefulWidget {
  static String id = 'mainpage';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    'Name Search',
    'Entity Creation',
    'Entity List',
  ];
  final List<IconData> _menuIcons = [
    IconlyLight.search,
    IconlyLight.edit,
    IconlyLight.document,
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int index = 0;
  int _selectedIndex = 0;
  static final List<Widget> _navScreens = <Widget>[
    Homepage(),
    Registration_Page(),
    Notifications(),
    Settings_Page(),
  ];
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(tranx, transy, 0)..scale(scale),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 15,
                spreadRadius: 5),
          ],
          borderRadius: BorderRadius.circular(30)),
      child: Scaffold(
        body: _navScreens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: GlobalVars.kPrimary,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: 'Home',
                activeIcon: Icon(IconlyBold.home)),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.discovery),
                label: 'Entites',
                activeIcon: Icon(IconlyBold.discovery)),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.notification),
                label: 'Notifications',
                activeIcon: Icon(IconlyBold.notification)),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.setting),
                label: 'Settings',
                activeIcon: Icon(IconlyBold.setting)),
          ],
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
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
                  height: _height * 0.30,
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
                                    onTap: () {
                                      switch (index) {
                                        case 0:
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Search_Screen()));
                                          break;
                                        case 1:
                                          Navigator.pop(context);
                                          showAlert(context, 'Entity Creation');

                                          break;
                                        case 2:
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Registration_Page()));
                                          break;
                                        default:
                                      }
                                    });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 180,
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
}
