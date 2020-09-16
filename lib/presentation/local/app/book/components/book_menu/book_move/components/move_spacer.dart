import 'package:flutter/material.dart';

class BookMoveSpacer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.0145,
    );
  }
}
