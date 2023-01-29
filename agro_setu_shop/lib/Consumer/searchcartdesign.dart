import 'package:agro_setu_shop/Consumer/productsList.dart';
import 'package:flutter/material.dart';
import 'productsList.dart';

class ProductsDesignWidget extends StatefulWidget {

  ProductsList? model;
  BuildContext?context;
  ProductsDesignWidget({
    this.model,
    this.context,
});
  @override
  State<ProductsDesignWidget> createState() => _ProductsDesignWidgetState();
}

class _ProductsDesignWidgetState extends State<ProductsDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 170,
            width:MediaQuery.of(context).size.width,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                minRadius: 50.0,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    widget.model!.product_image!,
                  ),
                ),
              ),
              const SizedBox(height: 15.0,),
              Text(
                widget.model!.product_name!,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(
                widget.model!.weight!,
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

