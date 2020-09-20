import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../bookshelf/bookshelf.dart';
import 'package:flutter/material.dart';
import 'components/constants.dart';
import 'components/on_selected.dart';
import 'components/menu_icon.dart';

class BookAppBar extends StatelessWidget {
  BookAppBar(
    this.book,
    this.uid,
  );

  final DocumentSnapshot book;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        highlightColor: Colors.transparent,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 35.0,
        ),
        onPressed: () => Navigator.pushNamed(
          context,
          Bookshelf.routeName,
        ),
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(
            Icons.subject,
            color: Colors.black,
            size: 35.0,
          ),
          itemBuilder: (BuildContext context) {
            return MenuActions.menuActions.map((String action) {
              return PopupMenuItem<String>(
                value: action,
                child: Row(
                  children: [
                    if (action == MenuActions.cover)
                      BookMenuIcon(FontAwesomeIcons.book),
                    if (action == MenuActions.about)
                      BookMenuIcon(FontAwesomeIcons.bookReader),
                    if (action == MenuActions.move)
                      BookMenuIcon(FontAwesomeIcons.exchangeAlt),
                    if (action == MenuActions.delete)
                      BookMenuIcon(FontAwesomeIcons.solidTrashAlt),
                    SizedBox(width: 10.0),
                    Text(
                      action,
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1,
                        color: action == MenuActions.delete
                            ? Colors.red[300]
                            : Colors.black,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              );
            }).toList();
          },
          onSelected: (action) => onSelected(
            action,
            context,
            book,
          ),
        ),
      ],
    );
  }
}
