import 'package:booknote/infrastructure/database/database.dart';
import '../../../../bookshelf/bookshelf.dart';
import 'package:flutter/material.dart';
import 'components/delete_button.dart';

AlertDialog deleteBookDialog({
  BuildContext context,
  String uid,
  String documentID,
}) {
  return AlertDialog(
    title: Text(
      'Delete',
      style: TextStyle(
        color: Colors.red[300],
      ),
    ),
    content: Text(
      'This book will be deleted!',
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
          DatabaseService(uid: uid).deleteBook(documentID);

          Navigator.pushNamed(context, Bookshelf.routeName);
        },
      ),
    ],
  );
}
