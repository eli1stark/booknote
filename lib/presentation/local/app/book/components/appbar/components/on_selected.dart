import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import '../../book_menu/book_cover/book_cover.dart';
import '../../book_menu/book_about/book_about.dart';
import '../../book_menu/book_delete/book_delete.dart';
import '../../book_menu/book_move/components/move_dialog.dart';

/// Takes MenuAction in BookPage and perform some action
void onSelected({
  String action,
  BuildContext context,
  DocumentSnapshot book,
  Map currentCategory,
  List categories,
  String uid,
}) {
  if (action == MenuActions.cover) {
    Navigator.pushNamed(
      context,
      BookCover.routeName,
      arguments: BookCoverArgument(
        bookContext: context,
        book: book,
        uid: uid,
      ),
    );
  } else if (action == MenuActions.about) {
    showDialog(
      context: context,
      builder: (_) => aboutBookDialog(
        bookContext: context,
        book: book,
      ),
    );
  } else if (action == MenuActions.move) {
    showDialog(
      context: context,
      builder: (_) => moveBookDialog(
        documentID: book.documentID,
        currentCategory: currentCategory,
        categories: categories,
        uid: uid,
      ),
    );
  } else if (action == MenuActions.delete) {
    showDialog(
      context: context,
      builder: (_) => deleteBookDialog(
        context: context,
        uid: uid,
        documentID: book.documentID,
      ),
    );
  }
}
