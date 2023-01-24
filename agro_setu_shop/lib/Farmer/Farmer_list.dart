import 'package:agro_setu_shop/product.dart';
import 'package:flutter/material.dart';

class Farmer_list extends StatelessWidget {
  const Farmer_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.count(
        primary: false,
        mainAxisSpacing: 5,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
          ...List.generate(
            my_Products.length,
            (index) => farmerCard(
              item: my_Products[index],
            ),
          ),
        ],
      ),
    );
  }
}

class farmerCard extends StatelessWidget {
  const farmerCard({
    Key? key,
    required farmer_Product this.item,
  }) : super(key: key);
  final farmer_Product item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.18,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(item.images,fit: BoxFit.fill),
              
            ),
          ),
          const SizedBox(height: 5),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            
          ),
         
          const SizedBox(height: 5),
          
        ],
      ),
    );
  }
}