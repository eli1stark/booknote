import 'package:booknote/presentation/local/bookshelf/bookshelf.dart';
import 'package:flutter/material.dart';

class BookMoveButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FlatButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.grey[200],
          child: Text(
            'CANCEL',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17.0,
            ),
          ),
          // color: Colors.grey[300],
          onPressed: () => Navigator.pop(context),
        ),
        SizedBox(width: size.width * 0.0487),
        FlatButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.grey[200],
          child: Text(
            'SUBMIT',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17.0,
            ),
          ),
          // color: Colors.grey[300],
          onPressed: () {
            // TODO move the book
            Navigator.pushNamed(context, Bookshelf.routeName);
          },
        ),
      ],
    );
  }
}
