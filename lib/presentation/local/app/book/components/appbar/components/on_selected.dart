import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import '../../book_menu/book_cover/book_cover.dart';
import '../../book_menu/book_about/book_about.dart';
import '../../book_menu/book_delete/book_delete.dart';
import '../../book_menu/book_move/book_move.dart';

/// Takes MenuAction in BookPage and perform some action
void onSelected(
  String action,
  BuildContext context,
  DocumentSnapshot book,
) {
  if (action == MenuActions.cover) {
    Navigator.pushNamed(
      context,
      BookCover.routeName,
    );
  } else if (action == MenuActions.about) {
    showDialog(
      context: context,
      builder: (context) => aboutBookDialog(context, book),
    );
  } else if (action == MenuActions.move) {
    showDialog(
      context: context,
      builder: (context) => moveBookDialog(context),
    );
  } else if (action == MenuActions.delete) {
    showDialog(
      context: context,
      builder: (context) => deleteBookDialog(context),
    );
  }
}
