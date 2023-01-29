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
      child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 60,
            width:MediaQuery.of(context).size.width,
          child: ListTile(
            title: Text(widget.model!.product_name!,style: TextStyle(fontSize: 20.0),),
            subtitle: Text(widget.model!.weight!),
            leading: SizedBox(
              width: 100,
               height: 100,
               child: Image.network(widget.model!.product_image!),
          ),
            trailing:const Icon(Icons.add_shopping_cart_outlined),
          ),
        ),
      ),
    );
  }
}

