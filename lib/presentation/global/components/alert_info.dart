import 'package:flutter/material.dart';

class AlertInfo extends StatelessWidget {
  AlertInfo({
    this.image,
    this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

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
