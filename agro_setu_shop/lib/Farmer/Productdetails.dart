// import 'dart:html';

import 'package:agro_setu_shop/Farmer/productdesc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Productdetails extends StatelessWidget {
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  final TextEditingController product_name = TextEditingController();
  final TextEditingController stock = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController weight = TextEditingController();

  // final List<TextEditingController> _controller = List.generate(4, (index) => TextEditingController());

  void addProduct() async {
    User? farmer;
    try {
      farmer = FirebaseAuth.instance.currentUser;
    } on PlatformException catch (e) {
      print(e);
    }

    FirebaseFirestore.instance.collection('Products').add({
      'seller_id': farmer?.uid,
      'product_name': product_name.text,
      'stock': int.parse(stock.text),
      'weight': weight.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Add Product",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  InputFile(
                    label: "Product Name",
                    controller: product_name,
                  ),
                  InputFile(label: "Stock Quanity", controller: stock),
                  InputFile(
                    label: "Price",
                    controller: price,
                  ),
                  InputFile(label: "weight", controller: weight),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState() => {dropdownvalue = newValue!};
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () => {
                    addProduct(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Productdesc()))
                  },
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "next",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputFile extends StatelessWidget {
  const InputFile({
    Key? key,
    required String this.label,
    required TextEditingController this.controller,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: false,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    //color: Colors.grey[400]
                    ),
              ),
              border: OutlineInputBorder(
                  //borderSide: BorderSide(color: Colors.grey[400])
                  )),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

// we will be creating a widget for text field
// Widget inputFile({label, obscureText = false} controller)
// {
// return Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: <Widget>[
//     Text(
//       label,
//       style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//           color:Colors.black87
//       ),
//
//     ),
//     SizedBox(
//       height: 5,
//     ),
//     TextField(
//       obscureText: obscureText,
//       // controller: _controller[i],
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0,
//               horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 //color: Colors.grey[400]
//             ),
//
//           ),
//           border: OutlineInputBorder(
//               //borderSide: BorderSide(color: Colors.grey[400])
//           )
//       ),
//     ),
//     SizedBox(height: 10,)
//   ],
// );
// }
