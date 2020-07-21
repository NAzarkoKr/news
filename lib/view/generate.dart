import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = 'Hello';
  final qrText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate QR',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: QrImage(
              size: 250.0,
              data: qrData,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: qrText,
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.blue, width: 5.0)),
            child: Text("Generate"),
            onPressed: () {
              if (qrText.text.isEmpty) {
                setState(() {
                  qrData = 'Hello';
                });
              } else {
                setState(() {
                  qrData = qrText.text;
                  qrText.text = '';
                });
              }
            },
          )
        ],
      ),
    );
  }
}
