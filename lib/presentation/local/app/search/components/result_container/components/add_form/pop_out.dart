import 'package:booknote/domain/search/result_from_api.dart';
import 'package:flutter/material.dart';
import 'add_form.dart';

showAddPopOut({
  @required BuildContext context,
  @required List categories,
  @required String uid,
  @required ResultFromAPI resultFromAPI,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 40.0,
          ),
          child: AddBookForm(
            categories: categories,
            uid: uid,
            resultFromAPI: resultFromAPI,
          ),
        ),
      );
    },
  );
}
