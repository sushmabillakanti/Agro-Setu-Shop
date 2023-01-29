import 'package:agro_setu_shop/Consumer/consumer_menu.dart';
import 'package:flutter/material.dart';
import '../Farmer/Profile_pic.dart';
import 'consumer_menu.dart';

class Profile_body2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Profile_menu2(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          Profile_menu2(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          Profile_menu2(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          Profile_menu2(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          Profile_menu2(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}