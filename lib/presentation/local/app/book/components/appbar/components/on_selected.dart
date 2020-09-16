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
) {
  if (action == MenuActions.cover) {
    Navigator.pushNamed(context, BookCover.routeName);
  } else if (action == MenuActions.about) {
    showDialog(
      context: context,
      builder: (_) => aboutBookDialog(_),
    );
  } else if (action == MenuActions.move) {
    showDialog(
      context: context,
      builder: (_) => moveBookDialog(_),
    );
  } else if (action == MenuActions.delete) {
    showDialog(
      context: context,
      builder: (_) => deleteBookDialog(_),
    );
  }
}
