// @dart=2.9
import 'package:flutter/material.dart';

import 'package:registrar_general_prototype/screens/authentication_screens/loginscreen.dart';
import 'package:registrar_general_prototype/screens/home_screens/homepage.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';
import 'package:registrar_general_prototype/screens/onBoarding_page/getstarted_page.dart';
import 'package:registrar_general_prototype/widgets/layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: GetStarted_Page(),
      routes: {
        MainPage.id: (context) => const MainPage(),
        LayoutScreen.id: (context) => LayoutScreen(),
        Homepage.id: (context) => const Homepage(),
      },
    );
  }
}
