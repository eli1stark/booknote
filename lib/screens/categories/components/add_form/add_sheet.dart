import 'package:flutter/material.dart';
import 'add_form.dart';

dialogFormToAddNewCategory(
  BuildContext context,
  List categories,
  int idCounter,
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
          child: AddForm(categories, idCounter),
        ),
      );
    },
  );
}
