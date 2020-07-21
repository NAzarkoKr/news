import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Images extends StatefulWidget {
  Images({Key key}) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Image',
            style: TextStyle(color: Colors.blue),
          ),
          centerTitle: true,
        ),
        body: Container(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (_imageFile != null) ...[
              Image.file(_imageFile),
            ],
            RaisedButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
              child: Text("Select Image"),
            ),
          ],
        ))));
  }
}
