import 'package:cloud_firestore/cloud_firestore.dart';
import '../../components/content_container.dart';
import 'package:flutter/material.dart';
import '../book_move.dart';

Dialog moveBookDialog({
  DocumentSnapshot book,
  Map currentCategory,
  List categories,
  String uid,
}) {
  return BookMenuContentContainer(
    child: BookMove(
      book: book,
      currentCategory: currentCategory,
      categories: categories,
      uid: uid,
    ),
  );
}
