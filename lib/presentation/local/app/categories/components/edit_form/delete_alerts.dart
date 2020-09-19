import 'package:booknote/infrastructure/database/database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../category_button.dart';

String oneLeftText = 'You can\'t delete the last remaining category!';
String isNotEmptyText =
    'In order to delete a category, it needs to be empty! Move books from this category to another or delete them.';

void showDeleteCategoryAlertError(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => deleteCategoryAlertError(
      context,
      text,
    ),
  );
}

/// Alert Dialog for DeleteCategoryState: \
/// 'oneLeft' and 'isNotEmpty'
Dialog deleteCategoryAlertError(BuildContext context, String text) {
  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FontAwesomeIcons.exclamationTriangle,
            color: Colors.yellow[700],
            size: 60.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 19.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          CategoryButton(
            text: 'CLOSE',
            color: Colors.grey[500],
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    ),
  );
}

/// Alert Dialog for DeleteCategoryState: \
/// 'isGood'
deleteCategoryAlertSuccess({
  BuildContext context,
  Map item,
  String uid,
  List categories,
}) {
  String fullItemTitle = item['emoji'] + item['title'];

  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      padding: EdgeInsets.only(
        top: 20.0,
        right: 20.0,
        left: 20.0,
        bottom: 5.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure you want to delete $fullItemTitle?',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CategoryButton(
                text: 'NO',
                size: 17.0,
                color: Colors.grey[500],
                onPressed: () => Navigator.pop(context),
              ),
              CategoryButton(
                text: 'YES',
                size: 17.0,
                color: Colors.grey[500],
                onPressed: () {
                  // remove category from the List of categories
                  categories.removeAt(item['indexKey']);

                  // update keys according to index of every map
                  for (int i = 0; i < categories.length; i++) {
                    categories[i]['indexKey'] = i;
                  }

                  // update Firestore
                  DatabaseService(uid: uid).updateCategories(categories);
                  // close alert
                  Navigator.pop(context);
                  // close edit sheet
                  Navigator.pop(context);
                },
              )
            ],
          )
        ],
      ),
    ),
  );
}
