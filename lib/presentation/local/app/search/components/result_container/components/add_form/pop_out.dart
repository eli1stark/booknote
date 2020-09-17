import 'package:booknote/domain/search/result_from_api.dart';
import 'package:flutter/material.dart';
import 'add_form.dart';

showAddPopOut({
  @required BuildContext context,
  @required List categories,
  @required ResultFromAPI resultFromAPI,
}) {
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
            categories: categories,
            resultFromAPI: resultFromAPI,
          ),
        ),
      );
    },
  );
}

// TODO refactor to general components because 'categories' also has the same functionality
