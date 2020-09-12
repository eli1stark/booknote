import 'package:flutter/material.dart';

/// EMAIL and PASSWORD Field Decoration
InputDecoration authFieldDecoration(bool firstField) {
  return InputDecoration(
    alignLabelWithHint: true,
    labelText: firstField == true ? 'EMAIL' : 'PASSWORD',
    labelStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    ),
    contentPadding: EdgeInsets.all(0),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 2.0,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
  );
}

/// BorderRadius.circular(30.0)
BorderRadius borderRadiusCiricular30 = BorderRadius.circular(30.0);
