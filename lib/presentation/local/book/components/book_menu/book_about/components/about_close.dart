import 'package:flutter/material.dart';

class BookAboutClose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomRight,
      child: FlatButton(
        child: Text(
          'Close',
          style: TextStyle(
            fontSize: size.width * 0.039,
          ),
        ),
        color: Colors.grey[300],
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
