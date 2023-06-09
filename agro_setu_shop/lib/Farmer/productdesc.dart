import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
            _handleURLButtonPress(context, ImageSourceType.gallery);
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
                  _image = File(image.path);
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
