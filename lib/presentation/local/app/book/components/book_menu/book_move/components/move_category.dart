import 'package:flutter/material.dart';

class BookMoveCategory extends StatelessWidget {
  const BookMoveCategory(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Text(
      text,
      style: TextStyle(
        fontSize: size.width * 0.0487,
      ),
    );
  }
}
