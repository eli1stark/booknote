import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/components/submit_button.dart';
import '../../../../bookshelf/bookshelf.dart';
import 'package:flutter/material.dart';

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
      SubmitButton(
        text: 'CANCEL',
        onPressed: () => Navigator.pop(context),
      ),
      SubmitButton(
        text: 'DELETE',
        onPressed: () {
          DatabaseService(uid: uid).deleteBook(documentID);

          Navigator.pushNamed(context, Bookshelf.routeName);
        },
      ),
    ],
  );
}
