import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Add Product",
          style: TextStyle(
            fontSize: 18,

          ),
        ),
      ],
    );
  }
}
