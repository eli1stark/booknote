import 'package:booknote/domain/auth/user.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appbar_button.dart';
import 'appbar_text.dart';

class EmojiPickerAppBar extends StatelessWidget {
  EmojiPickerAppBar({
    @required this.item,
    @required this.categories,
    @required this.status,
  });

  /// Single category
  final Map item;

  /// List of added categories
  final List categories;

  /// Can be only 'add' or 'update'
  final String status;

  @override
  Widget build(BuildContext context) {
    // get user id
    String uid = Provider.of<AppUser>(context).uid;

    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: Container(),
      actions: [
        AppBarButton(
          text: 'Remove',
          onTap: () {
            // update Item(Map)
            item['emoji'] = '';

            if (status == 'update') {
              // update Categories(List of Maps)
              categories[item['indexKey']] = item;

              // update Firestore
              DatabaseService(uid: uid).updateCategories(categories);
              Navigator.pop(context);
            } else if (status == 'add') {
              // go back to the AddForm() with Item(Map)
              Navigator.pop(context, item);
            }
          },
        ),
        Expanded(
          child: AppBarText(
            text: 'Category Icon',
            color: Colors.black,
          ),
        ),
        AppBarButton(
          text: 'Close',
          onTap: () {
            if (status == 'update') {
              Navigator.pop(context);
            } else if (status == 'add') {
              // go back to the AddForm() with Item(Map)
              Navigator.pop(context, item);
            }
          },
        ),
      ],
    );
  }
}
