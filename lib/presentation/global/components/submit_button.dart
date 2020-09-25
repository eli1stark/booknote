import 'package:flutter/material.dart';

const Color grey200 = Color(0xFFEEEEEE);

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.color = Colors.grey,
    this.splashColor = grey200,
    this.size = 17.0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final double size;
  final Color color;
  final Color splashColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      highlightColor: Colors.transparent,
      splashColor: splashColor,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
