import 'package:agro_setu_shop/Farmer/faccount.dart';
import 'package:agro_setu_shop/Farmer/vproduct.dart';
import 'package:agro_setu_shop/size_config.dart';
import 'package:flutter/material.dart';

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
    Icon(Icons.home),
    Icon(Icons.category),
    Icon(Icons.shopping_cart),
    Icon(Icons.account_circle_rounded),
  ];
  List routes = const[
    Dashboard(),
    Orders(),
    Products(),
    Account()
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
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
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