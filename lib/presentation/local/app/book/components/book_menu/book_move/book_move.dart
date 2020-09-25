import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/move_buttons.dart';
import 'components/move_category.dart';
import 'components/move_spacers.dart';
import 'components/move_title.dart';

class BookMove extends StatefulWidget {
  BookMove({
    @required this.documentID,
    @required this.currentCategory,
    @required this.categories,
    @required this.uid,
  });

  final String documentID;
  final Map currentCategory;
  final List categories;
  final String uid;

  @override
  _BookMoveState createState() => _BookMoveState();
}

class _BookMoveState extends State<BookMove> {
  // default to the first category in the list
  int chosenCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    List newCategories = [];

    // sort categories (remove current category)
    for (var i in widget.categories) {
      if (i != widget.currentCategory) {
        newCategories.add(i);
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BookMoveTitle('From'),
        BookMoveSpacer10px(),
        BookMoveCategory(
          widget.currentCategory,
        ),
        // BookMoveSpacer(),
        BookMoveSpacer20px(),
        BookMoveTitle('To'),
        Container(
          height: 90,
          width: 200,
          child: CupertinoPicker(
            itemExtent: 30,
            diameterRatio: 1,
            scrollController: FixedExtentScrollController(
              initialItem: chosenCategoryIndex,
            ),
            onSelectedItemChanged: (int index) =>
                setState(() => chosenCategoryIndex = index),
            children: [
              for (Map category in newCategories)
                Center(
                  child: AutoSizeText(
                    category['emoji'] + category['title'],
                    maxLines: 1,
                  ),
                )
            ],
          ),
        ),
        BookMoveSpacer20px(),
        BookMoveButtons(
          documentID: widget.documentID,
          chosenCategoryIndex: chosenCategoryIndex,
          newCategories: newCategories,
          uid: widget.uid,
        )
      ],
    );
  }
}
