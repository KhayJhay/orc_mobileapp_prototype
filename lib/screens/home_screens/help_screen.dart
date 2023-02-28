import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registrar_general_prototype/screens/home_screens/help_detail_page.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';
import 'package:registrar_general_prototype/utils/constants.dart';

class Help_Support_Page extends StatelessWidget {
  const Help_Support_Page({super.key});

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
                    color: Colors.black.withOpacity(0.7),
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
                                Navigator.pop(context);
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Help & Support',
                            style: GlobalVars.kBigTitleBblack,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Help_Card_Widget(
                          colors: GlobalVars.kPrimary.withOpacity(0.3),
                          title: 'Name Search',
                          press: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Help_Detail_Page(
                                      helpTitle: 'Name Search Help Page'),
                                ));
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Help_Card_Widget(
                          colors: GlobalVars.kTertiary.withOpacity(0.3),
                          title: 'Business Entity',
                          press: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Help_Detail_Page(
                                      helpTitle: 'Business Entity Help Page'),
                                ));
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Help_Card_Widget(
                          colors: Colors.blue.withOpacity(0.3),
                          title: 'Entity Creation',
                          press: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Help_Detail_Page(
                                      helpTitle: ' Entity Creation Help Page'),
                                ));
                          }),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}

class Help_Card_Widget extends StatelessWidget {
  final String title;
  final Color colors;
  final VoidCallback press;
  const Help_Card_Widget({
    Key? key,
    required this.title,
    required this.press,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: colors),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Right from the application home screen, navigate to the business name search page, Search for your business name, business name shows up when found in ORC database',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: press,
          child: Text(
            'Click here for more tips',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ]),
    );
  }
}
