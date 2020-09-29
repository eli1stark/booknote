import 'package:booknote/application/book/note_state_cubit.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../book_editor/components/helpers.dart';
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';
import 'components/little_bar.dart';
import 'components/sheet_decoration.dart';

class BookSheet extends StatefulWidget {
  BookSheet(this.book);

  final DocumentSnapshot book;

  @override
  _BookSheetState createState() => _BookSheetState();
}

class _BookSheetState extends State<BookSheet> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // Create 'BookNoteCubit' instance
      final BookNoteCubit noteCubit = BlocProvider.of<BookNoteCubit>(context);

      loadDocument(widget.book['bookID']).then((document) {
        noteCubit.update(ZefyrController(document));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookNoteCubit, ZefyrController>(
      builder: (context, noteState) {
        return DraggableScrollableSheet(
          initialChildSize: 0.56,
          minChildSize: 0.56,
          builder: (BuildContext context, scrollController) {
            return BookSheetDecoration(
              child: ListView(
                controller: scrollController,
                children: [
                  LittleBar(),
                  (noteState == null)
                      ? Loader()
                      : Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 10.0,
                          ),
                          child: ZefyrView(
                            document: noteState.document,
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
