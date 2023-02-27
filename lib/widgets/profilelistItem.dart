import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../utils/constants.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final VoidCallback? press;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.press,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
          horizontal: 12,
        ).copyWith(
          bottom: 20,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              this.icon,
              size: 18,
              color: GlobalVars.kPrimary,
            ),
            SizedBox(width: 15),
            Text(
              this.text,
              style: TextStyle(fontFamily: 'Poppins-Regular'),
            ),
            Spacer(),
            if (this.hasNavigation)
              Icon(
                IconlyLight.arrow_right_2,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}
