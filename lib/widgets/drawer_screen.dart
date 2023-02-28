import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/screens/home_screens/contact_page.dart';
import 'package:registrar_general_prototype/screens/home_screens/help_screen.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';
import 'package:registrar_general_prototype/screens/home_screens/search_screen.dart';
import 'package:registrar_general_prototype/screens/onBoarding_page/getstarted_page.dart';
import 'package:registrar_general_prototype/screens/onBoarding_page/search_screen.dart';
import 'package:registrar_general_prototype/utils/constants.dart';

class Drawer_Screen extends StatefulWidget {
  @override
  _Drawer_ScreenState createState() => _Drawer_ScreenState();
}

class _Drawer_ScreenState extends State<Drawer_Screen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: GlobalVars.kTertiary,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: GlobalVars.kPrimary,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mary Taylor Brown',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'marybrown@gmail.com',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              buildMenuItem(
                text: 'Dashboard',
                icon: IconlyLight.home,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'Name Search',
                icon: IconlyLight.search,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'Registered Entities',
                icon: Icons.business_rounded,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'Help & Support',
                icon: Icons.help_outline,
                onClicked: () => selectedItem(context, 4),
              ),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                text: 'About Us',
                icon: Icons.info,
                onClicked: () => selectedItem(context, 5),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 115.0),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              buildMenuItem(
                text: 'Notifications',
                icon: Icons.notifications_active_outlined,
                onClicked: () => selectedItem(context, 6),
              ),
              SizedBox(
                height: _height <= 820 ? 14 : 24,
              ),
              buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectedItem(context, 7),
              ),
              SizedBox(
                height: _height <= 820 ? 14 : 24,
              ),
              buildMenuItem(
                  text: 'Log Out',
                  icon: Icons.logout_outlined,
                  onClicked: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GetStarted_Page()))),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildHeader({
  required String name,
  required String email,
  required IconData icon,
  VoidCallback? onClicked,
}) =>
    InkWell(
      onTap: onClicked,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  color: Colors.deepPurple,
                  size: 38,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: TextStyle(color: color, fontFamily: 'Poppins-Light'),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => Profile_Page(),
      // ));
      break;
    case 1:
      Navigator.pop(context);
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Login_Search_Screen(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Registration_Page(),
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Help_Support_Page(),
      ));
      break;
    case 5:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => About_Page(),
      // ));
      break;
    case 6:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => Notifications_Screen(),
      // ));
      break;
    case 7:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => Home_Page(),
      // ));
      break;
  }
}
