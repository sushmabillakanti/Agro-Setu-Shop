// import 'dart:html';

import 'dart:io';

import 'package:agro_setu_shop/Farmer/Farmer_home.dart';
import 'package:agro_setu_shop/Farmer/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Map cat = {
  'veggies': 'Vegetables',
  'fruits': 'Fruits',
  'd&n': 'Dry Fruits & Nuts',
  'spices': 'Spices',
  'milk': 'Milk & Products',
  'eggs': 'Eggs',
  'm&l': 'Millets & Legumes',
  't&c': 'Tea & Coffee',
};

List<String> list = [];
var it = cat.forEach((key, value) {
  list.add(value);
});

class Productdetails extends StatefulWidget {
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  String dropdownvalue = 'vegetables';

  // List of items in our dropdown menu

  final TextEditingController product_name = TextEditingController();

  final TextEditingController stock = TextEditingController();

  final TextEditingController price = TextEditingController();

  final TextEditingController weight = TextEditingController();

  // final TextEditingController category = TextEditingController();

  String downloadUrlImage = "";

  // final List<TextEditingController> _controller = List.generate(4, (index) => TextEditingController());
  XFile? imgXFile;

  final ImagePicker imagePicker = ImagePicker();

  getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgXFile;
    });
  }

  void addProduct() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    fStorage.Reference storeRef = fStorage.FirebaseStorage.instance
        .ref()
        .child("FarmerProducts")
        .child(fileName);
    fStorage.UploadTask upload = storeRef.putFile(File(imgXFile!.path));
    fStorage.TaskSnapshot taskSnapshot = await upload.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((urlImage) {
      downloadUrlImage = urlImage;
    });

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
      'category': dropdownvalue,
      'product_image': downloadUrlImage,
      'price': int.parse(price.text)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      "Add Products",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
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
                  InputFile(label: "Stock Quantity", controller: stock),
                  InputFile(
                    label: "Price",
                    controller: price,
                  ),
                  InputFile(label: "weight", controller: weight),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: double.maxFinite,
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownvalue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String item) {
                      print(item);
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                ),
              ),

              Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: OutlinedButton(
                          onPressed: () {
                            getImageFromGallery();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.upload_rounded,
                                color: Colors.green,
                              ),
                              Text(
                                "Pick Image from Gallery",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )),
                    ),
                  )),
              Center(
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Home();
                        },
                        child: Text(
                          'Add Product',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                  ))
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
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: false,
          controller: controller,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),

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

enum ImageSourceType { gallery, camera }

class Productdesc extends StatelessWidget {
  const Productdesc({Key? key}) : super(key: key);

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                "Pick Image from Gallery",
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // _handleURLButtonPress(context, ImageSourceType.gallery);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                "Pick Image from Camera",
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                _handleURLButtonPress(context, ImageSourceType.camera);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImageFromGalleryEx extends StatefulWidget {
  final type;

  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agro Setu Shop'),
      ),
      body: Column(
        children: <Widget>[
          Text(type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery"),
          SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  // _image = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.grey.shade400),
                child: _image != null
                    ? Image.file(
                        _image,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.grey.shade400),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
