import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/utils/constants.dart';

import '../../widgets/profilelistItem.dart';

class Settings_Page extends StatelessWidget {
  const Settings_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: GlobalVars.kHeaderstyle,
              ),
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_crop_circle_badge_checkmark,
                        color: GlobalVars.kPrimary,
                        size: 22,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Account",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Bold',
                            color: GlobalVars.kPrimary),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ProfileListItem(
                  icon: IconlyBold.lock,
                  press: () {},
                  text: 'Change password',
                ),
                ProfileListItem(
                  icon: IconlyBold.edit,
                  press: () {},
                  text: 'Edit profile',
                ),
                ProfileListItem(
                  icon: IconlyBold.delete,
                  press: () {},
                  text: 'Delete account',
                ),
              ]),
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.add_circled_solid,
                        color: GlobalVars.kPrimary,
                        size: 22,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "More",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Bold',
                            color: GlobalVars.kPrimary),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ProfileListItem(
                  icon: IconlyBold.notification,
                  press: () {},
                  text: 'Notifications',
                ),
                ProfileListItem(
                  icon: Icons.help,
                  press: () {},
                  text: 'Help & Support',
                ),
                ProfileListItem(
                  icon: IconlyBold.info_circle,
                  press: () {},
                  text: 'About Us',
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
