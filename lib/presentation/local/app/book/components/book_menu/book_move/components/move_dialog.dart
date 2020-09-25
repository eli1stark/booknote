import '../../components/content_container.dart';
import 'package:flutter/material.dart';
import '../book_move.dart';

Dialog moveBookDialog({
  String documentID,
  Map currentCategory,
  List categories,
  String uid,
}) {
  return BookMenuContentContainer(
    child: BookMove(
      documentID: documentID,
      currentCategory: currentCategory,
      categories: categories,
      uid: uid,
    ),
  );
}
