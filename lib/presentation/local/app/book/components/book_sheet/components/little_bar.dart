import 'package:flutter/material.dart';

class LittleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.black.withOpacity(0.2),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.44,
      ),
      height: size.height * 0.008,
    );
  }
}
