import 'package:flutter/material.dart';
import '../styles.dart';
import 'add_form.dart';

dialogFormToAddNewCategory(
  BuildContext context,
  List categories,
  int idCounter,
  String uid,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        backgroundColor: Colors.grey[200],
        child: Container(
          padding: addFormPadding,
          child: AddForm(
            categories,
            idCounter,
            uid,
          ),
        ),
      );
    },
  );
}
