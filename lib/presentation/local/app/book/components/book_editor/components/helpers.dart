import 'dart:convert'; // access to jsonEncode()
import 'dart:io'; // access to File and Directory classes
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:path_provider/path_provider.dart';

/// Loads the document asynchronously from a file if it exists,
/// otherwise returns default document(is empty).
Future<NotusDocument> loadDocument(String bookID) async {
  // appDir path to the app_flutter file
  Directory appDocDir = await getApplicationDocumentsDirectory();
  
  final file = File(appDocDir.path + '/$bookID.json');

  if (await file.exists()) {
    final contents = await file.readAsString();
    return NotusDocument.fromJson(jsonDecode(contents));
  }
  // if not exists return empty note
  final Delta delta = Delta()..insert('\n');
  return NotusDocument.fromDelta(delta);
}

/// Convert Notus to JSON and save as a File
void saveDocument(
  BuildContext context,
  ZefyrController controller,
  String bookID,
) async {
  // Notus documents can be easily serialized to JSON by passing to
  // `jsonEncode` directly
  final contents = jsonEncode(controller.document);

  // appDir path to the app_flutter file
  Directory appDocDir = await getApplicationDocumentsDirectory();

  final file = File(appDocDir.path + '/$bookID.json');
  
  // Save our document.
  // And show a snack bar on success.
  file.writeAsString(contents).then((_) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('SAVED'),
      ),
    );
  });
}
