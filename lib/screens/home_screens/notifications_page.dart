import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:registrar_general_prototype/screens/home_screens/mainpage.dart';

import '../../utils/constants.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ));
                      },
                      icon: Icon(
                        IconlyLight.arrow_left_2,
                        color: GlobalVars.kPrimary,
                        size: 18,
                      )),
                ),
                Text(
                  "Notifications",
                  style: GlobalVars.kHeaderstyle,
                ),
                SizedBox(
                  width: 3,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 140),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/lotties/not.json",
                      height: 250,
                    ),
                    Text(
                      "you have no notifications yet",
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
