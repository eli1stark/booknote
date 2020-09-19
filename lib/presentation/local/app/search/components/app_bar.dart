import 'package:flutter/material.dart';
import 'styles.dart';

class SearchAppBar extends StatelessWidget {
  SearchAppBar({
    this.onPressed,
    this.onFieldSubmitted,
  });

  final Function onPressed;
  final Function onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.grey[200],
        padding: EdgeInsets.all(0.0),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 35.0,
        ),
        onPressed: onPressed,
      ),
      titleSpacing: 0.0,
      title: Container(
        padding: EdgeInsets.only(right: 5.0),
        child: TextFormField(
          textInputAction: TextInputAction.search,
          textCapitalization: TextCapitalization.sentences,
          decoration: searchFieldDecoration,
          autofocus: true,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ),
    );
  }
}
