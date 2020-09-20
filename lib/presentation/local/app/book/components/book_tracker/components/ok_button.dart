import 'package:flutter/material.dart';

class TrackerOkButton extends StatelessWidget {
  TrackerOkButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.grey[200],
      child: Text(
        'OK',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 17.0,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
