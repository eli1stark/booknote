import 'package:flutter/material.dart';

class BookCoverHint extends StatelessWidget {
  const BookCoverHint(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.0074,
        left: size.width * 0.0245,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size.width * 0.049,
        ),
      ),
    );
  }
}
