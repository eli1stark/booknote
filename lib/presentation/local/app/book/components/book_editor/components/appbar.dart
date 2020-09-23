import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

class EditorAppBar extends StatelessWidget {
  EditorAppBar({
    this.onSave,
    this.controller,
    this.bookID,
  });

  final Function(
    BuildContext context,
    ZefyrController controller,
    String bookID,
  ) onSave;
  final ZefyrController controller;
  final String bookID;

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
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        Builder(
          builder: (context) => IconButton(
            icon: Icon(
              FontAwesomeIcons.save,
              color: Colors.black,
              size: 35.0,
            ),
            onPressed: () => onSave(
              context,
              controller,
              bookID,
            ),
          ),
        )
      ],
    );
  }
}
