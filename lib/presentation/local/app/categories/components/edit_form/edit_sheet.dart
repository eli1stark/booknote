import 'package:booknote/infrastructure/database/database.dart';
import 'package:flutter/material.dart';
import 'delete_button.dart';
import 'edit_form.dart';

void showSettingsPanel(context, item, categories) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      // 'SingleChildScrollView' widget to make bottom sheet expand according to content
      return SingleChildScrollView(
        // Container and padding to make sheet move along with keyboard
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Ciricular border
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          // make padding inside Sheet
          child: Stack(
            children: [
              DeleteButton(
                onTap: () {
                  // remove category from the List of categories
                  categories.removeAt(item['indexKey']);

                  // update keys according to index of every map
                  for (int i = 0; i < categories.length; i++) {
                    categories[i]['indexKey'] = i;
                  }

                  // update Firestore
                  DatabaseService().updateCategories(categories);
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 60.0,
                ),
                child: EditForm(
                  item: item,
                  categories: categories,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
