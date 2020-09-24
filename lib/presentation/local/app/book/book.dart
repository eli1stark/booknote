import 'package:booknote/application/book/cover_state_cubit.dart';
import 'package:booknote/application/book/note_state_cubit.dart';
import 'package:booknote/application/book/tracker_state_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zefyr/zefyr.dart';
import 'components/appbar/app_bar.dart';
import 'components/book_box/book_box.dart';
import 'components/book_sheet/book_sheet.dart';

class BookArgument {
  BookArgument({
    @required this.book,
    @required this.uid,
    @required this.currentCategory,
    @required this.categories,
  });

  final DocumentSnapshot book;
  final String uid;
  final Map currentCategory;
  final List categories;
}

class Book extends StatelessWidget {
  static const routeName = '/book';

  @override
  Widget build(BuildContext context) {
    // Get Argument(path) from Bookshelf page
    BookArgument arg = ModalRoute.of(context).settings.arguments;

    // Allows to control the editor and the document.
    ZefyrController zefyrController;

    return MultiBlocProvider(
      providers: [
        BlocProvider<CoverStateCubit>(
          create: (BuildContext context) => CoverStateCubit(
            customImage: arg.book['pathToLocalCustomCover'],
            selectedImage: arg.book['currentImage']['linkPath'],
            network: arg.book['currentImage']['network'],
          ),
        ),
        BlocProvider<BookTrackerCubit>(
          create: (BuildContext context) => BookTrackerCubit(
            arg.book['pages'],
            arg.book['pagesRead'],
          ),
        ),
        BlocProvider<BookNoteCubit>(
          create: (BuildContext context) => BookNoteCubit(
            zefyrController,
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: BookAppBar(
            book: arg.book,
            uid: arg.uid,
            categories: arg.categories,
            currentCategory: arg.currentCategory,
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: Stack(
          children: <Widget>[
            BookBox(arg.book, arg.uid),
            BookSheet(arg.book),
          ],
        ),
      ),
    );
  }
}
