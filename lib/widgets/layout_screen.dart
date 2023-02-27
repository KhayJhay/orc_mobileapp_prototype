import 'package:flutter/material.dart';
import 'package:registrar_general_prototype/screens/home_screens/homepage.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';

import 'drawer_screen.dart';

class LayoutScreen extends StatefulWidget {
  static String id = 'layout_screen';
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Drawer_Screen(),
          const MainPage(),
        ],
      ),
    );
  }
}
