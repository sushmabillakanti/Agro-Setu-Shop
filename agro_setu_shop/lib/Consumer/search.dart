import 'package:agro_setu_shop/Consumer/productsList.dart';
import 'package:agro_setu_shop/Consumer/searchcartdesign.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<QuerySnapshot>? postDocumentsList;
  String EnteredText = '';

  initSearchingPost(String textEntered) {
    postDocumentsList = FirebaseFirestore.instance
        .collection('Products')
        .where('product_name',isGreaterThanOrEqualTo: textEntered)
        .get();
    setState(() {
      postDocumentsList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                onChanged: (textEntered)
                {
                  setState((){
                    EnteredText = textEntered;
                  });
                  initSearchingPost(textEntered);
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search,color: Colors.white,),
                      onPressed: () {
                        initSearchingPost(EnteredText);
                      },
                    ),
                    hintText: 'Search',
                    border: InputBorder.none),
              ),
            ),
          )),

      body:FutureBuilder<QuerySnapshot> (
        future: postDocumentsList,
        builder: (context, snapshot){
          return snapshot.hasData
              ?
              ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index) {
                  ProductsList model = ProductsList.fromJson(
                      snapshot.data!.docs[index].data()! as Map<String, dynamic>
                  );
                  return ProductsDesignWidget(
                    model: model,
                    context: context,
                  );
                }
              )
          :
          const Center(child :Text("No records Exists!!"),);
        },
      ),
    );;
  }
}

