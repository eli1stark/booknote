import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../styles.dart';
import 'delete_button.dart';
import 'edit_form.dart';
import 'helpers.dart';

void showSettingsPanel(
  BuildContext context,
  Map item,
  List categories,
  List<DocumentSnapshot> books,
  String uid,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      // 'SingleChildScrollView' to make bottom sheet expand according to content
      return SingleChildScrollView(
        // Container and padding to make sheet move along with keyboard
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Ciricular border
          decoration: editSheetDecoration,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: DeleteButton(
                  onTap: () => deleteCategory(
                    context: context,
                    item: item,
                    uid: uid,
                    categories: categories,
                    books: books,
                  ),
                ),
              ),
              Container(
                padding: editFormPadding,
                child: EditForm(
                  item: item,
                  categories: categories,
                  uid: uid,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
