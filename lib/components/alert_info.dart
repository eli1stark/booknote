import 'package:flutter/material.dart';

class AlertInfo extends StatelessWidget {
  AlertInfo({this.image, this.text, this.size});

  final String image;
  final String text;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height * 0.55,
        child: Column(
          children: [
            Flexible(
              child: Image.asset(
                image,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
