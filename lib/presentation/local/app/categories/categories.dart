import 'package:booknote/domain/categories/categories.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'categories_display.dart';

class CategoriesArgument {
  CategoriesArgument(this.uid);

  String uid;
}

class Categories extends StatelessWidget {
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    // Get argument('uid') from Bookshelf page
    CategoriesArgument arg = ModalRoute.of(context).settings.arguments;

    return MultiProvider(
        providers: [
          StreamProvider<CategoriesData>.value(
            value: DatabaseService(uid: arg.uid).categories,
          ),
          StreamProvider<QuerySnapshot>.value(
            value: DatabaseService(uid: arg.uid).books,
          ),
        ],
      child: CategoriesDisplay(arg.uid),
    );
  }
}
