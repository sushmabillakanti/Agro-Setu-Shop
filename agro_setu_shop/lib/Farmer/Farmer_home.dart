import 'package:agro_setu_shop/Farmer/Productdetails.dart';
import 'package:agro_setu_shop/Farmer/faccount.dart';
import 'package:agro_setu_shop/Farmer/vproduct.dart';
import 'package:agro_setu_shop/size_config.dart';
import 'package:flutter/material.dart';

import 'Profile_body.dart';
import 'dashboard.dart';
import 'orders.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agro Setu Shop'),
      ),
      body: Container(
        child: Navbar(),
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.dashboard),
    Icon(Icons.receipt_long),
    Icon(Icons.inventory),
    Icon(Icons.account_circle_rounded),
  ];
  List routes = [
    Dashboard(),
    Orders(),
    Productdetails(),
    Profile_body()
  ];
  Widget _route = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _route,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.green,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
            _route = routes[_currentIndex];
          });
        },
        items: const [
          BottomNavigationBarItem(label: 'Dashboard', icon: Icon(Icons.dashboard)),
          BottomNavigationBarItem(
            label: 'Orders',
            icon: Icon(Icons.receipt_long),
          ),
          BottomNavigationBarItem(
            label: 'Products',
            icon: Icon(Icons.inventory),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
    );
  }
}