import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({
    @required this.text,
    @required this.onPressed,
    this.color = Colors.black,
    this.size = 20.0,
  });

  final String text;
  final Function onPressed;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.grey[300],
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
