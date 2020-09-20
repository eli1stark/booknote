import 'package:booknote/infrastructure/database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../bookshelf/bookshelf.dart';
import 'package:flutter/material.dart';

class BookMoveButtons extends StatelessWidget {
  BookMoveButtons({
    @required this.book,
    @required this.chosenCategoryIndex,
    @required this.newCategories,
    @required this.uid,
  });

  final DocumentSnapshot book;
  final int chosenCategoryIndex;
  final List newCategories;
  final String uid;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.grey[200],
          child: Text(
            'CANCEL',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17.0,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        SizedBox(width: size.width * 0.0487),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.grey[200],
          child: Text(
            'SUBMIT',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17.0,
            ),
          ),
          onPressed: () {
            DatabaseService(uid: uid).updateBookCategoryID(
              book.documentID,
              newCategories[chosenCategoryIndex]['id'],
            );

            Navigator.pushNamed(context, Bookshelf.routeName);
          },
        ),
      ],
    );
  }
}
