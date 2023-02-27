import 'package:flutter/material.dart';
import 'package:registrar_general_prototype/screens/onBoarding_page/getstarted_page.dart';
import 'package:registrar_general_prototype/screens/onBoarding_page/page_slider.dart';
import 'package:lottie/lottie.dart';

class Introduction_Page extends StatefulWidget {
  const Introduction_Page({Key? key}) : super(key: key);

  @override
  State<Introduction_Page> createState() => _Introduction_PageState();
}

class _Introduction_PageState extends State<Introduction_Page> {
  PageController pageController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: _height,
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            PageSlider(
                hero: Lottie.asset(
                  "assets/lotties/lott1.json",
                ),
                title: "Business Registration",
                subtitle:
                    "Do you know you must register your business if you're trading under a business name?",
                onNext: nextPage),
            PageSlider(
                hero: Image.asset(
                  "assets/images/Unt.jpeg",
                ),
                title: "Estate Administration",
                subtitle:
                    "This covers administering estate of deceased, payment of commuted person & death gratuity as well trust administration",
                onNext: nextPage),
            PageSlider(
                hero: Lottie.asset(
                  "assets/lotties/lott2.json",
                  height: 350,
                ),
                title: "Intellectual Property",
                subtitle:
                    "An idea, process, brand or product can be protected and prevent other people from benefiting",
                onNext: nextPage),
            GetStarted_Page(),
          ],
        ),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}
