import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../global/components/alert_info.dart';
import 'custom_gridview.dart';
import 'image_frame.dart';

/// Sort books according to the current category. \
/// Return List<ImageFrame>. \
/// IF there aren't any book in the current category: \
/// Return AlterInfo.
Widget processBooks({
  String uid,
  Map currentCategory,
  List categories,
  List<DocumentSnapshot> books,
}) {
  List<ImageFrame> sortedBooks = [];

  for (DocumentSnapshot book in books) {
    if (currentCategory['id'] == book['categoryID']) {
      sortedBooks.add(
        ImageFrame(
          linkPath: book['currentImage']['linkPath'],
          network: book['currentImage']['network'],
          book: book,
          uid: uid,
          currentCategory: currentCategory,
          categories: categories,
        ),
      );
    }
  }

  if (sortedBooks.length == 0) {
    return Card(
      child: AlertInfo(
        image: 'images/no_content.png',
        text: 'No Content!',
      ),
    );
  } else {
    return CustomGridView(sortedBooks);
  }
}
