import 'package:agro_setu_shop/Server/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  Firebase_auth controller = Get.put(Firebase_auth());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getOrdersFarmer();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
            () => controller.products == null
            ? const CircularProgressIndicator()
            : Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.orderd_products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Display(
                        product: controller.orderd_products[index],
                    );
                  }),
            ));
  }
}

class Display extends StatefulWidget {
  const Display({Key? key,
  required this.product,
  }) : super(key: key);
  final Map<String, dynamic> product;

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20, right: 20, top:10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                "${widget.product['product_image']}",
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, bottom: 8, left: 8, right: 100),
              child: SizedBox(
                width: 100,
                child: Text(
                  "${widget.product['product_name']}",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 12,
              child: Text('${widget.product['count'].toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  // backgroundColor: Colors.red,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

