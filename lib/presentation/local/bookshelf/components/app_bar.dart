import 'package:booknote/presentation/local/search/search.dart';
import 'package:flutter/material.dart';

AppBar bookshelfAppBar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    // building Icon to create new context to open drawer
    leading: Builder(
      builder: (context) => IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.grey[200],
        icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 35.0,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    ),
    actions: <Widget>[
      IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.grey[200],
        icon: Icon(
          Icons.search,
          color: Colors.black,
          size: 35.0,
        ),
        onPressed: () {
          Navigator.pushNamed(context, Search.routeName);
        },
      ),
    ],
  );
}
