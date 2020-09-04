import 'package:booknote/infrastructure/database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'global/components/loader.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController test1Controller;
  TextEditingController test2Controller;
  TextEditingController test3Controller;

  String text1;
  String text2;
  String text3;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: DatabaseService().testText,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // initialize database variable
          var testData = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: Text('TEST'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'test1: ${testData['test1']}',
                  controller: test1Controller,
                  onChanged: (value) {
                    setState(() {
                      text1 = value;
                    });
                  },
                ),
                CustomText(
                  text: 'test2: ${testData['test2']}',
                  controller: test2Controller,
                  onChanged: (value) {
                    setState(() {
                      text2 = value;
                    });
                  },
                ),
                CustomText(
                  text: 'test3: ${testData['test3']}',
                  controller: test3Controller,
                  onChanged: (value) {
                    setState(() {
                      text3 = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    DatabaseService().updateTest1(text1);
                  },
                )
              ],
            ),
          );
        } else {
          return Loader();
        }
      },
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    this.text,
    this.controller,
    this.onChanged,
  });

  final String text;
  final TextEditingController controller;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: text,
        ),
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
    );
  }
}

// Calculator for calculation if dimensions of an image
// calculator(Size size) {
//   print('**********************');
//   // height: 187 / 1.05,
//   // width: 132 / 1.05,
//   var height = 187 / 1.05;
//   var width = 132 / 1.05;

//   print('Image Height: $height');
//   print('Image Width: $width');

//   var heightDimension = height / size.height;
//   var widthDimension = width / size.width;

//   print('Image heightDimension: $heightDimension');
//   print('Image widthDimension: $widthDimension');

//   var checkNewHeight = size.height * heightDimension;
//   var checkNewWidth = size.width * widthDimension;

//   print('Image checkNewHeight: $checkNewHeight');
//   print('Image checkNewWidth: $checkNewWidth');

//   print('**********************');
// }
