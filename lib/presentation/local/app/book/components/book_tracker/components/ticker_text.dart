import 'package:flutter/material.dart';

class TickerText extends StatelessWidget {
  TickerText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}
