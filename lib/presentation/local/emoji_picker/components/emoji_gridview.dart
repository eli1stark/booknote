import 'package:booknote/infrastructure/database/database.dart';
import 'package:flutter/material.dart';

class EmojiGridView extends StatelessWidget {
  const EmojiGridView({
    @required this.emojiMap,
    @required this.item,
    @required this.categories,
    @required this.status,
  });

  /// List of emojis
  final Map emojiMap;

  /// Single category
  final Map item;

  /// List of added categories
  final List categories;

  /// Can be only 'add' or 'update'
  final String status;
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: 5.0,
        bottom: 10.0,
      ),
      children: <Widget>[
        for (String emoji in emojiMap.values)
          InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                emoji,
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
            ),
            onTap: () {
              // update Item(Map)
              item['emoji'] = emoji;

              if (status == 'update') {
                // update Categories(List of Maps)
                categories[item['indexKey']] = item;

                // update Firestore
                DatabaseService().updateCategories(categories);
                Navigator.pop(context);
              } else if (status == 'add') {
                // go back to the AddForm()
                Navigator.pop(context, item);
              }
            },
          ),
      ],
    );
  }
}
