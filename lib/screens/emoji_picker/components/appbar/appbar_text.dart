import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  AppBarText({
    this.text,
    this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.black54,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
