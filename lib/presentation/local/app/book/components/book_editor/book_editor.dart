import 'package:booknote/application/book/note_state_cubit.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zefyr/zefyr.dart';
import 'components/appbar.dart';
import 'components/helpers.dart';

class BookEditorArgument {
  BookEditorArgument(
    this.book,
    this.bookContext,
  );

  final DocumentSnapshot book;
  final BuildContext bookContext;
}

class BookEditor extends StatefulWidget {
  static const routeName = '/book_editor';

  @override
  BookEditorState createState() => BookEditorState();
}

class BookEditorState extends State<BookEditor> {
  /// Allows to control the editor and the document.
  ZefyrController controller;

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();

    // future that allows us to access context. function is called inside the future
    // otherwise it would be skipped and args would return null
    // More: https://stackoverflow.com/questions/56262655/flutter-get-passed-arguments-from-navigator-in-widgets-states-initstate
    Future.delayed(Duration.zero, () {
      BookEditorArgument argument;

      setState(() {
        // get arguments from the BookBox
        argument = ModalRoute.of(context).settings.arguments;
      });

      loadDocument(argument.book['bookID']).then((document) {
        setState(() {
          controller = ZefyrController(document);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // get arguments from the BookBox
    BookEditorArgument arg = ModalRoute.of(context).settings.arguments;

    // Create 'BookNoteCubit' instance
    final BookNoteCubit noteCubit =
        BlocProvider.of<BookNoteCubit>(arg.bookContext);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: EditorAppBar(
          onSave: saveDocument,
          controller: controller,
          bookID: arg.book['bookID'],
          noteCubit: noteCubit,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      // If controller is null we show loader, otherwise
      // display Zefyr editor.
      body: (controller == null)
          ? Loader()
          // Note that the editor requires special `ZefyrScaffold` widget
          // to be one of its parents.
          : ZefyrScaffold(
              child: ZefyrEditor(
                padding: EdgeInsets.all(15.0),
                controller: controller,
                focusNode: focusNode,
                mode: ZefyrMode.edit,
                autofocus: false,
              ),
            ),
    );
  }
}
