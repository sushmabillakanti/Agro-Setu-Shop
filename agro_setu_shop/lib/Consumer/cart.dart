import 'package:agro_setu_shop/Server/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Firebase_auth controller = Get.put(Firebase_auth());
  late int bill = controller.generate_bill();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.products == null
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cart_products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartCard(
                            product: controller.cart_products[index],
                            cart: controller,
                            bill: bill);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 20),
                          child: Text(
                            'Summary',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Subtotal',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '${controller.generate_bill()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Delivery charges',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '3.00',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Total Bill',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '${controller.generate_bill() + 3}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.placeOrder();
                            },
                            child: Text(
                              'Buy now',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )),
                      ),
                    ))
              ],
            ),
          ),
    );
  }
}

class CartCard extends StatefulWidget {
  CartCard({
    Key? key,
    required this.product,
    required this.cart,
    required this.bill,
  }) : super(key: key);

  final Firebase_auth cart;
  final Map<String, dynamic> product;
  late int bill;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  void _increment() async {
    setState(() {
      widget.product['count']++;
      widget.bill = widget.cart.generate_bill();
    });
  }

  void _decrement() async {
    setState(() {
      widget.product['count']--;
      widget.bill = widget.cart.generate_bill();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
      child: Container(
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "${widget.product['product_image']}",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 8, right: 70),
                child: SizedBox(
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.product['product_name']}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          "${widget.product['weight']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        "₹" + "${widget.product['price']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        _decrement();
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline_rounded,
                        color: Colors.red,
                      )),
                  Text(
                    widget.product['count'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  IconButton(
                      splashRadius: 20,
                      onPressed: () => {_increment()},
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.green,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
