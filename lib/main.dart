import 'package:booknote/models/categories.dart';
import 'package:booknote/screens/search/search.dart';
import 'package:booknote/services/database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'screens/emoji_picker/emoji_picker.dart';
import 'theme/scroll_behavior.dart';
import 'screens/bookshelf/bookshelf.dart';
import 'screens/book/book.dart';
import 'screens/categories/categories.dart';
import 'screens/test.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Booknote());
}

class Booknote extends StatelessWidget {
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    // User data goes down the Stream using Multiprovider
    // I can configure streams as many as I want
    return MultiProvider(
      providers: [
        StreamProvider<CategoriesData>.value(
          value: DatabaseService().userCategories,
        ),
        StreamProvider<QuerySnapshot>.value(
          value: DatabaseService().userBooks,
        ),
        // to be continued
      ],
      child: MaterialApp(
        // remove debug banner
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ScrollConfiguration(
            // removing  GlowingOverscrollIndicator
            behavior: CustomScrollBehavior(),
            child: child,
          );
        },
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Lato',
          accentColor: Colors.grey,
        ),
        initialRoute: Bookshelf.routeName,
        routes: {
          Bookshelf.routeName: (context) => Bookshelf(),
          Book.routeName: (context) => Book(),
          Categories.routeName: (context) => Categories(),
          EmojiPicker.routeName: (context) => EmojiPicker(),
          Search.routeName: (context) => Search(),
          '/test': (context) => Test(),
        },
      ),
    );
  }
}
