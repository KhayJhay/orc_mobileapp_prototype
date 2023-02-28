import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';
import 'package:registrar_general_prototype/utils/constants.dart';

class Help_Detail_Page extends StatelessWidget {
  final String helpTitle;
  const Help_Detail_Page({super.key, required this.helpTitle});

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
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 50,
                              color: GlobalVars.kPrimary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Video not available',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins-Light'),
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
                            helpTitle,
                            style: GlobalVars.kBigTitleBblack,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '* Business Entity Search :',
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
                          onPressed: () {},
                          child: Text(
                            'Click here to navigate to business entity page',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '* Name Search :',
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
                          onPressed: () {},
                          child: Text(
                            'Click here to navigate to name search',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '* Entity Creation:',
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
                          onPressed: () {},
                          child: Text(
                            'Click here to navigate to entity creation page',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
