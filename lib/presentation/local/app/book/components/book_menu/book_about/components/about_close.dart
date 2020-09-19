import 'package:flutter/material.dart';

class BookAboutClose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.grey[200],
        child: Text(
          'CLOSE',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
