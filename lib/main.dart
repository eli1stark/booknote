import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'domain/categories.dart';
import 'infrastructure/database/database.dart';
import 'presentation/global/theme/scroll_behavior.dart';
import 'presentation/local/book/components/book_menu/book_cover/book_cover.dart';
import 'presentation/local/book/components/book_tracker/book_tracker.dart';
import 'presentation/local/emoji_picker/emoji_picker.dart';
import 'presentation/local/bookshelf/bookshelf.dart';
import 'presentation/local/book/book.dart';
import 'presentation/local/categories/categories.dart';
import 'presentation/local/search/search.dart';
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
          BookCover.routeName: (context) => BookCover(),
        },
      ),
    );
  }
}
