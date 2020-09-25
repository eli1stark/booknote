import 'package:flutter/material.dart';
import 'add_form/add_sheet.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton(
    this.categories,
    this.idCounter,
    this.uid,
  );

  final List categories;
  final int idCounter;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black87,
      child: Icon(
        Icons.add,
        size: 30.0,
        color: Colors.white,
      ),
      onPressed: () {
        // show dialog form to add new Category
        dialogFormToAddNewCategory(
          context,
          categories,
          idCounter,
          uid,
        );
      },
    );
  }
}
