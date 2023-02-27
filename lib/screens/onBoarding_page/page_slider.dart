// @dart=2.9
import 'package:flutter/material.dart';
import 'package:registrar_general_prototype/utils/constants.dart';

import '../../widgets/animated_indicator.dart';

class PageSlider extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const PageSlider({Key key, this.hero, this.title, this.subtitle, this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: hero,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  title,
                  style: GlobalVars.kTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  subtitle,
                  style: GlobalVars.kSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35,
                ),
                ProgressButton(onNext: onNext),
              ],
            ),
          ),
          GestureDetector(
            onTap: onNext,
            child: Text(
              "Skip",
              style: GlobalVars.kSubtitleStyle,
            ),
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key key, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            child: SizedBox(
                height: 40,
                child: Image.asset(
                  "assets/pngs/COA.png",
                )),
            onTap: onNext,
          ),
        )
      ]),
    );
  }
}
