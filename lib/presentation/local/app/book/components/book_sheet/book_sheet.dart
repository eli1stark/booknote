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
  // Zefyr editor like any other input field requires a focus node.
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();

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
                children: <Widget>[
                  LittleBar(),
                  (noteState == null || noteState.document.length == null)
                      ? Loader()
                      : Container(
                          // I need to restrict the height to avoid errors
                          // noteState.document.length is the
                          // length of the note in terms of the NotusDocument
                          height: noteState.document.length * 4.5,
                          width: double.infinity,
                          // Note that the editor requires special `ZefyrScaffold` widget
                          // to be one of its parents.
                          child: ZefyrScaffold(
                            child: ZefyrEditor(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 10.0,
                              ),
                              controller: noteState,
                              focusNode: focusNode,
                              mode: ZefyrMode.view,
                              autofocus: false,
                              // disable scrolling
                              physics: NeverScrollableScrollPhysics(),
                            ),
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
