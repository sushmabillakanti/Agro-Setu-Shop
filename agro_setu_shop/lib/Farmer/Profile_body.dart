import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Profile_body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Profile_menu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          Profile_menu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          Profile_menu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          Profile_menu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          Profile_menu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}