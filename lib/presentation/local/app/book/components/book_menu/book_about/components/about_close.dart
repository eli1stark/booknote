import 'package:flutter/material.dart';

class BookAboutClose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomRight,
      child: FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.grey[200],
        child: Text(
          'CLOSE',
          style: TextStyle(
            fontSize: size.width * 0.04,
            color: Colors.grey
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
