import 'package:flutter/material.dart';

class AddBookButton extends StatelessWidget {
  const AddBookButton({
    @required this.onPressed,
  });

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: RaisedButton(
        child: Text('Add'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

