import 'package:flutter/material.dart';

/// for the 'Edit' and 'Add' form of the Categories Page
const categoryFieldDecoration = InputDecoration(
  hintText: 'Enter name',
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2.0,
    ),
  ),
);

BoxDecoration editSheetDecoration = BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

EdgeInsets editFormPadding = EdgeInsets.symmetric(
  vertical: 20.0,
  horizontal: 60.0,
);

EdgeInsets addFormPadding = EdgeInsets.symmetric(
  vertical: 30.0,
  horizontal: 40.0,
);
