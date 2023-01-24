import 'package:agro_setu_shop/farmer/Farmer_list.dart';
import 'package:flutter/material.dart';


class Productdesc extends StatelessWidget {
  const Productdesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agro Setu Shop'),
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Farmer_list()));
            },
            child: Text('Save'),
          ),
      ),
    );
  }
}