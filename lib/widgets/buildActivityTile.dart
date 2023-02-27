import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../utils/constants.dart';

/*
class ActivityTileWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? press;
  const ActivityTileWidget({
    Key? key,
    this.title,
    this.icon,
    this.subtitle,
    this.press,
    });

  @override
  Widget build(BuildContext context) {
      double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;
    return Container(
    padding: EdgeInsets.all(20),
    height: 120,
    width: _width,
    decoration: BoxDecoration(
      color: GlobalVars.kSecondary.withOpacity(0.25),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 33,
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            size: 33,
            color: GlobalVars.kPrimary,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins-SemiBold',
                  color: GlobalVars.kPrimary),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, fontFamily: 'Poppins-Regular'),
            ),
          ],
        ),
        Icon(
          IconlyLight.arrow_right_2,
          size: 30,
          color: GlobalVars.kPrimary,
        ),
      ],
    ),
  );
  }
}
*/
Widget buildActivityTile(
  BuildContext context,
  String title,
  String subtitle,
  IconData icon,
  VoidCallback press,
) {
  double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: press,
    child: Container(
      padding: EdgeInsets.all(20),
      height: 120,
      width: _width,
      decoration: BoxDecoration(
        color: GlobalVars.kPrimary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: 33,
              color: GlobalVars.kPrimary,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins-SemiBold',
                    color: GlobalVars.kPrimary),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, fontFamily: 'Poppins-Regular'),
              ),
            ],
          ),
          Icon(
            IconlyLight.arrow_right_2,
            size: 30,
            color: GlobalVars.kPrimary,
          ),
        ],
      ),
    ),
  );
}

Widget buildEntityTile(
  BuildContext context,
  String title,
  String subtitle,
  IconData icon,
  VoidCallback press,
) {
  double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: press,
    child: Container(
      padding: EdgeInsets.all(20),
      height: _height <= 820 ? 100 : 120,
      width: _width,
      decoration: BoxDecoration(
        color: GlobalVars.kPrimary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: _height <= 820 ? 23 : 33,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: _height <= 820 ? 23 : 33,
              color: GlobalVars.kPrimary,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: _height <= 820 ? 13 : 16,
                    fontFamily: 'Poppins-SemiBold',
                    color: GlobalVars.kPrimary),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: _height <= 820 ? 8 : 12,
                    fontFamily: 'Poppins-Regular'),
              ),
            ],
          ),
          Icon(
            CupertinoIcons.ellipsis_vertical,
            size: _height <= 820 ? 23 : 30,
            color: GlobalVars.kPrimary,
          ),
        ],
      ),
    ),
  );
}
