import 'package:flutter/material.dart';
import 'package:agro_setu_shop/Farmer/Profile_body.dart';

class Profile extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Profile_body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}