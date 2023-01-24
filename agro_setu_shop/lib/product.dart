import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  // final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.images,
    // required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Product> demoProducts = [
  Product(
      images: ["assets/images/onion.jpg"],
      title: 'Fresh Onions 1kg',
      price: 60,
      description: 'Farm fresh Onions',
      rating: 4.8,
      isFavourite: true,
      isPopular: true),
  Product(
      images: ["assets/images/potatoes.jpg"],
      title: 'Fresh Potatoes 1kg',
      price: 75,
      description: 'Freshly harvested Potatoes',
      rating: 4.5,
      isPopular: true,
      isFavourite: true),
  Product(
      images: ["assets/images/tomatoes.jpg"],
      title: 'Fresh tomatoes 1kg',
      price: 45,
      description: 'Farm fresh Tomatoes',
      rating: 4.6,
      isFavourite: true,
      isPopular: true),
  Product(
      images: ["assets/images/white rice.jpg"],
      title: 'Sona masoori 5kgs',
      price: 350,
      description: 'White rice',
      rating: 4.9,
      isPopular: true,
      isFavourite: true),
];

class GroupItems {
  final String img, title;

  GroupItems({
    required this.img,
    required this.title,
  });
}

List<GroupItems> items = [
  GroupItems(img: 'assets/images/veggies.png', title: 'Vegetables'),
  GroupItems(img: 'assets/images/fruits.png', title: 'Fruits'),
  GroupItems(img: 'assets/images/dryfruits.png', title: 'Dry Fruits & Nuts'),
  GroupItems(img: 'assets/images/spices.png', title: 'Spices'),
  GroupItems(img: 'assets/images/milk.png', title: 'Milk & Products'),
  GroupItems(img: 'assets/images/egg1.jpg', title: 'Eggs'),
  GroupItems(img: 'assets/images/legumes.jpg', title: 'Millets & Legumes'),
  GroupItems(img: 'assets/images/tea.png', title: 'Tea & Coffee'),

];


// for farmers
class farmer_Product {
  final String title;
  final String images;

  // final List<Color> colors;
  final double  price;
  final bool instock;

  farmer_Product({
    required this.images,
    required this.title,
    required this.price,
    this.instock = true,
  });
}

List<farmer_Product> my_Products = [
  farmer_Product(
      images: "assets/strawberry.jpg",
      title: 'Strawberry',
      price: 200,
      instock: true),
  farmer_Product(
      images: "assets/potato.jpg",
      title: 'Potatoes',
      price: 60,
      instock: true),
  farmer_Product(
      images: "assets/onion.jpg",
      title: 'Onions',
      price: 43,
      instock: true),
  farmer_Product(
      images: "assets/apples.jpg",
      title: 'Apples',
      price: 68,
      instock: true),
];
