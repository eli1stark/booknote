import 'package:flutter/material.dart';
import 'add_form.dart';

showAddPopOut(
  BuildContext context,
  Size size,
  String title,
  String authors,
  String pages,
  String published,
  String bookID,
  List categories,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Colors.grey[200],
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 40.0,
          ),
          child: AddBookForm(
            size: size,
            title: title,
            authors: authors,
            pages: pages,
            published: published,
            bookID: bookID,
            categories: categories,
          ),
        ),
      );
    },
  );
}

// TODO refactor to genral components because 'categories' also has the same functionality
