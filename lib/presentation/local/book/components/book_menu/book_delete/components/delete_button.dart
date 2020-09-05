import 'package:flutter/material.dart';

class DeleteBookButton extends StatelessWidget {
  const DeleteBookButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.grey[200],
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
