import 'package:flutter/material.dart';

class BookMoveSpacer10px extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.0147,
    );
  }
}

class BookMoveSpacer20px extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.0293,
    );
  }
}
