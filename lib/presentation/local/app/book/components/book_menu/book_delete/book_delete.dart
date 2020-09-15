import '../../../../bookshelf/bookshelf1.dart';
import 'package:flutter/material.dart';
import 'components/delete_button.dart';

AlertDialog deleteBookDialog(BuildContext context) {
  return AlertDialog(
    title: Text(
      'Delete',
      style: TextStyle(
        color: Colors.red[300],
      ),
    ),
    content: Text(
      'This book will be removed!',
      style: TextStyle(
        fontSize: 17.0,
      ),
    ),
    actions: [
      DeleteBookButton(
        text: 'CANCEL',
        onPressed: () => Navigator.pop(context),
      ),
      DeleteBookButton(
        text: 'DELETE',
        onPressed: () {
          // TODO delete the book from Firestore
          Navigator.pushNamed(context, Bookshelf1.routeName);
        },
      ),
    ],
  );
}
