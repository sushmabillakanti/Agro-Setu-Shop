import 'package:agro_setu_shop/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Consumer/sign_up.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  @override
  Widget build(BuildContext context) {
    return const H2Carousel();
  }
}

class H2Carousel extends StatefulWidget {
  const H2Carousel({Key? key}) : super(key: key);

  @override
  State<H2Carousel> createState() => _H2CarouselState();
}

class _H2CarouselState extends State<H2Carousel> {
  List imgList = [
    'assets/images/h1.jpeg',
    'assets/images/h2.jpeg',
    'assets/images/h3.jpeg'
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
       SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CarouselSlider(
          items: imgList
              .map((item) => Image.asset(
            item,
            // width: double.infinity,
            // height: ,
            fit: BoxFit.fill,
          ))
              .toList(),
          carouselController: carouselController,
          options: CarouselOptions(
              height: double.infinity,
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              viewportFraction: 1,
              // enlargeCenterPage: true,
              // enlargeFactor: 0.1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ),
      ),
        Container(
          margin: const EdgeInsets.fromLTRB(100, 50, 50, 50),
          child: Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => (MyStatefulWidget())));
                      },
                      child: const Text('Log in')
                  )
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 50, 100, 50),
          child: Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Register')
                  )
              )
          ),
        ),
      ]
    );
  }
}


