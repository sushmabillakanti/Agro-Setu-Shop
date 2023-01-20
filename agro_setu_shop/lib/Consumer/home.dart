import 'package:agro_setu_shop/Consumer/categories.dart';
import 'package:agro_setu_shop/product.dart';
import 'package:agro_setu_shop/size_config.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'account.dart';
import 'cart.dart';

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

class H1Carousel extends StatefulWidget {
  const H1Carousel({Key? key}) : super(key: key);

  @override
  State<H1Carousel> createState() => _H1CarouselState();
}

class _H1CarouselState extends State<H1Carousel> {
  List imgList = [
    'assets/images/cs1.png',
    'assets/images/cs2.png',
    'assets/images/cs3.png'
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imgList
          .map((item) => Image.asset(
        item,
        fit: BoxFit.cover,
        width: double.infinity,
      ))
          .toList(),
      carouselController: carouselController,
      options: CarouselOptions(
          scrollPhysics: const BouncingScrollPhysics(),
          autoPlay: true,
          aspectRatio: 2,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          }),
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
    Body(),
    Categories(),
    Cart(),
    Account()
  ];
  Widget _route = Body();

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

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          H1Carousel(),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            width: double.infinity,
            height: 92,
            decoration: BoxDecoration(
                color: Colors.brown[700],
                borderRadius: BorderRadius.circular(20)),
            child: const Text.rich(
              TextSpan(
                  text: "Grab the deal !!\n",
                  style: TextStyle(color: Colors.white, height: 1.35),
                  children: [
                    TextSpan(
                        text: "Upto 10% Cashback 🥳",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))
                  ]),
            ),
          ),
          SectionTitle(
            text: "Freshly stocked",
            press: () {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  demoProducts.length,
                  (index) => ProductCard(
                    product: demoProducts[index],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SectionTitle(text: 'Eat healthy, Be Healthy', press: (){}),
          Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: AspectRatio(
              aspectRatio: 1.8,
              child: Container(
                child: Image.asset('assets/images/millets.jpg',
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetion = 1.5,
    required this.product,
  }) : super(key: key);
  final double width, aspectRetion;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
          width: width,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRetion,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(product.images[0]),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  "₹${product.price}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade600,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: (){},
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        // color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add_shopping_cart)),
                ),
              ]),
            ],
          )),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF2E7D32),
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
              child: Text("See More"),
            ),
          ],
        ));
  }
}
