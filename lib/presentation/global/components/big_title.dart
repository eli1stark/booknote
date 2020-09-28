import 'package:flutter/material.dart';

class BigTitle extends StatelessWidget {
  BigTitle({
    @required this.text,
    @required this.size,
  });

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          bottom: 5.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Suez One',
            fontSize: size,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
