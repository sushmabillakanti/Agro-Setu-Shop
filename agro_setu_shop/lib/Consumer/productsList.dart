import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsList{
  // String?price;
  String?product_name;
  String?weight;
  String?product_image;

  ProductsList({
    // this.price,
    this.product_name,
    // this.stock,
    this.weight,
    this.product_image,
});

  ProductsList.fromJson(Map<String, dynamic> json){
    // price = json['price'];
    product_name = json['product_name'];
    // stock = json['stock'];
    weight = json['weight'];
    product_image = json['product_image'];
  }

  Map<String , dynamic> toJson(){
    final Map<String, dynamic > data =  Map<String, dynamic>();
    // data['price'] = price;
    data['product_name'] = product_name;
    // data['stock'] = stock;
    data['weight'] = weight;
    data['product_image'] = product_image;

    return data;

  }
}