import 'package:flutter/material.dart';

class BookMoveCategory extends StatelessWidget {
  const BookMoveCategory(
    this.currentCategory,
  );

  final Map currentCategory;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Text(
      currentCategory['emoji'] + currentCategory['title'],
      style: TextStyle(
        fontSize: size.width * 0.0487,
      ),
    );
  }
}
