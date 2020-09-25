import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/components/submit_button.dart';
import '../../../../../bookshelf/bookshelf.dart';
import 'package:flutter/material.dart';

class BookMoveButtons extends StatelessWidget {
  BookMoveButtons({
    @required this.documentID,
    @required this.chosenCategoryIndex,
    @required this.newCategories,
    @required this.uid,
  });

  final String documentID;
  final int chosenCategoryIndex;
  final List newCategories;
  final String uid;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SubmitButton(
          text: 'CANCEL',
          onPressed: () => Navigator.pop(context),
        ),
        SizedBox(width: size.width * 0.03),
        SubmitButton(
          text: 'SUBMIT',
          onPressed: () {
            DatabaseService(uid: uid).updateBookCategoryID(
              documentID,
              newCategories[chosenCategoryIndex]['id'],
            );

            Navigator.pushNamed(context, Bookshelf.routeName);
          },
        ),
      ],
    );
  }
}
