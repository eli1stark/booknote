import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';
import 'components/appbar.dart';
// change: add these two lines to imports section at the top of the file
import 'dart:convert'; // access to jsonEncode()
import 'dart:io'; // access to File and Directory classes

class BookEditor extends StatefulWidget {
  static const routeName = '/book_editor';

  @override
  BookEditorState createState() => BookEditorState();
}

class BookEditorState extends State<BookEditor> {
  /// Allows to control the editor and the document.
  ZefyrController _controller;

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _loadDocument().then((document) {
      setState(() {
        _controller = ZefyrController(document);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // If _controller is null we show Material Design loader, otherwise
    // display Zefyr editor.
    final Widget body = (_controller == null)
        ? Center(child: CircularProgressIndicator())
        // Note that the editor requires special `ZefyrScaffold` widget
        // to be one of its parents.
        : ZefyrScaffold(
            child: ZefyrEditor(
              padding: EdgeInsets.all(16),
              controller: _controller,
              focusNode: _focusNode,
              mode: ZefyrMode.edit,
              autofocus: false,
            ),
          );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                FontAwesomeIcons.save,
                color: Colors.black,
                size: 35.0,
              ),
              onPressed: () => _saveDocument(context),
            ),
          )
        ],
      ),
      body: body,
    );
  }

  /// Loads the document asynchronously from a file if it exists,
  /// otherwise returns default document.
  Future<NotusDocument> _loadDocument() async {
    final file = File(Directory.systemTemp.path + '/quick_start.json');
    if (await file.exists()) {
      final contents = await file.readAsString();
      return NotusDocument.fromJson(jsonDecode(contents));
    }
    final Delta delta = Delta()..insert('\n');
    return NotusDocument.fromDelta(delta);
  }

  // Convert Notus to JSON and save as a File
  void _saveDocument(BuildContext context) {
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly
    final contents = jsonEncode(_controller.document);
    // For this example we save our document to a temporary file.
    final file = File(Directory.systemTemp.path + '/quick_start.json');
    // And show a snack bar on success.
    file.writeAsString(contents).then((_) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('SAVED')));
    });
  }
}

// TODO Premium feature
// UPLOAD
// convert JSON to String
// upload to the Firestore

// LOAD
// load String from the Firestore
// convert String to JSON
// display note in the App

