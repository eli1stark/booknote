import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'components/book_frame.dart';
import 'components/box_button.dart';
import '../book_tracker/components/show_dialog.dart';
import '../book_editor/book_editor.dart';

class BookBox extends StatelessWidget {
  BookBox(
    this.book,
    this.uid,
  );

  final DocumentSnapshot book;
  final String uid;

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
              onTap: () => showBookTrackerDialog(
                context,
                book,
                uid,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: BookFrame(
              book['currentImage'],
            ),
          ),
          // TODO connect BookEditor to the database
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
