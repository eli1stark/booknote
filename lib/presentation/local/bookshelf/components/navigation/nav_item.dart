import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  MenuItem({this.text, this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 23.0,
            ),
          ),
        ),
      ),
    );
  }
}
