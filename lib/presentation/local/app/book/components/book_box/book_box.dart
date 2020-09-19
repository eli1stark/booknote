import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../book_editor/book_editor.dart';
import '../book_tracker/book_tracker.dart';
import 'components/book_frame.dart';
import 'components/box_button.dart';

class BookBox extends StatelessWidget {
  BookBox(this.book);

  final DocumentSnapshot book;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: BookBoxButton(
              icon: FontAwesomeIcons.thumbtack,
              onTap: () => showDialog(
                context: context,
                builder: (context) => bookTrackerDialog(context),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: BookFrame(
              book['currentImage'],
            ),
          ),
          Expanded(
            flex: 3,
            child: BookBoxButton(
              icon: FontAwesomeIcons.pencilAlt,
              onTap: () => Navigator.pushNamed(
                context,
                BookEditor.routeName,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
