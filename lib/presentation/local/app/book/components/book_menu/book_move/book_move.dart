import 'package:flutter/material.dart';
import 'components/move_buttons.dart';
import 'components/move_category.dart';
import 'components/move_spacer.dart';
import 'components/move_title.dart';
import '../components/content_container.dart';

Dialog moveBookDialog(BuildContext context) {
  return BookMenuContentContainer(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookMoveTitle('From:'),
        BookMoveSpacer(),
        // TODO get current category
        BookMoveCategory('🦿Ficition'),
        BookMoveSpacer(),
        BookMoveTitle('To:'),
        DropdownButton<String>(
          value: categories[0]['emoji'] + categories[0]['title'],
          isExpanded: true,
          hint: BookMoveTitle('Select category'),
          icon: Icon(Icons.arrow_downward),
          iconSize: 26,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (String newValue) {
            // TODO
          },
          items: [
            for (Map category in categories)
              DropdownMenuItem<String>(
                value: category['emoji'] + category['title'],
                child: BookMoveCategory(
                  category['emoji'] + category['title'],
                ),
              ),
          ],
        ),
        BookMoveSpacer(),
        BookMoveButtons()
      ],
    ),
  );
}

List categories = [
  {
    'emoji': '🦿',
    'title': 'Fiction',
  },
  {
    'emoji': '🎩',
    'title': 'Science',
  },
  {
    'emoji': '🎯',
    'title': 'Favorite',
  },
  {
    'emoji': '🐭',
    'title': 'Read',
  },
];
