// import 'package:firebase_core/firebase_core.dart';
import 'package:agro_setu_shop/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final CollectionReference productList = FirebaseFirestore.instance.collection('Products');
var itemsList = [];

Future getProductList() async {

  try {
    await productList.get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
          itemsList.add(element.data());
          // print(element.data());
      }

      }
    );
  }
  catch (e) {
    print(e.toString());
    return null;
  }
}



class FetchData extends StatefulWidget {
  const FetchData({Key? key,
  required this.id,
  }) : super(key: key);
  final String id;


  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  String? id;

  _FetchDataState({this.id});

  @override
  void initState() {
    // getProductList();
    super.initState();
    // getProductList();
    setState(() {
      getProductList();
      // Navigator.pop(context);
    });
  }

  Widget build(BuildContext context) {
    // getProductList();
    return Card(
      child: Container(
          child: ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (BuildContext context, int index) {
                return  itemsList[index]['category'] == "milk" ? Card(
                  child: ListTile(
                    title: Text('${itemsList[index]['product_name']}'),
                    subtitle: Text('${itemsList[index]['weight']}'),
                    leading: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        minHeight: 100,
                        maxWidth: 100,
                        maxHeight: 250,
                      ),
                      child: Image.network(itemsList[index]['product_image']),
                    ),
                    trailing: Text('${itemsList[index]['stock']}'),
                  ),
                ):Container();
              },
              )
          ),
      );
  }

}




