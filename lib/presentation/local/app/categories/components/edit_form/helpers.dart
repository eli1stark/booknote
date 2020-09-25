import 'package:booknote/domain/categories/delete_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'delete_alerts.dart';

/// Validates name of the Category
String editFieldValidator(
  String value,
  String itemTitle,
  List categories,
) {
  bool titleExists = false;

  for (Map category in categories) {
    if (value == category['title'] && value != itemTitle) {
      titleExists = true;
    }
  }

  if (value.isEmpty) {
    return 'Please enter name';
  } else if (titleExists) {
    return 'Category already exists';
  } else if (value.length > 20) {
    return 'Name needs to be less than 20 characters';
  } else {
    return null;
  }
}

/// [ERROR STATE] \
/// IF DeleteCategoryState.oneLeft show AlertError. \
/// IF DeleteCategoryState.isNotEmpty show AlertError. \
/// [GOOD STATE] \
/// IF DeleteCategoryState.isGood show AlertSuccess.
void deleteCategory({
  BuildContext context,
  Map item,
  String uid,
  List categories,
  List<DocumentSnapshot> books,
}) {
  // get Delete State
  DeleteCategoryState result = deleteButtonValidator(
    item,
    categories,
    books,
  );

  if (result == DeleteCategoryState.oneLeft) {
    showDeleteCategoryAlertError(context, oneLeftText);
  } else if (result == DeleteCategoryState.isNotEmpty) {
    showDeleteCategoryAlertError(context, isNotEmptyText);
  } else {
    showDialog(
      context: context,
      builder: (context) => deleteCategoryAlertSuccess(
        context: context,
        item: item,
        uid: uid,
        categories: categories,
      ),
    );
  }
}

/// [ERROR STATE] \
/// IF only one category left return DeleteCategoryState.oneLeft. \
/// IF category has some books return DeleteCategoryState.isNotEmpty. \
/// [GOOD STATE] \
/// IF 2 statements above are false return DeleteCategoryState.isGood.
DeleteCategoryState deleteButtonValidator(
  Map item,
  List categories,
  List<DocumentSnapshot> books,
) {
  int deleteCandidateId = item['id'];

  bool categoryIsNotEmpty = false;

  for (var book in books) {
    if (book['categoryID'] == deleteCandidateId) {
      categoryIsNotEmpty = true;
    }
  }

  if (categories.length == 1) {
    return DeleteCategoryState.oneLeft;
  } else if (categoryIsNotEmpty) {
    return DeleteCategoryState.isNotEmpty;
  } else {
    return DeleteCategoryState.isGood;
  }
}
