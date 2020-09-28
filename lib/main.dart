import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/auth/user.dart';
import 'infrastructure/auth/auth.dart';
import 'presentation/global/theme/scroll_behavior.dart';
import 'presentation/local/app/bookshelf/bookshelf.dart';
import 'presentation/local/app/search/search.dart';
import 'presentation/local/auth/authentication.dart';
import 'presentation/local/app/book/components/book_editor/book_editor.dart';
import 'presentation/local/app/book/components/book_menu/book_cover/book_cover.dart';
import 'presentation/local/app/emoji_picker/emoji_picker.dart';
import 'presentation/local/app/book/book.dart';
import 'presentation/local/app/categories/categories.dart';
import 'presentation/local/controller/controller.dart';

void main() => runApp(Booknote());

class Booknote extends StatelessWidget {
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    // uid goes down the Stream
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            // remove GlowingOverscrollIndicator
            behavior: CustomScrollBehavior(),
            child: child,
          );
        },
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Lato',
          primaryColor: Colors.white,
          accentColor: Colors.grey,
        ),
        initialRoute: Controller.routeName,
        routes: {
          Bookshelf.routeName: (context) => Bookshelf(),
          Book.routeName: (context) => Book(),
          Categories.routeName: (context) => Categories(),
          EmojiPicker.routeName: (context) => EmojiPicker(),
          Search.routeName: (context) => Search(),
          BookCover.routeName: (context) => BookCover(),
          BookEditor.routeName: (context) => BookEditor(),
          Authentication.routeName: (context) => Authentication(),
          Controller.routeName: (context) => Controller()
        },
      ),
    );
  }
}
