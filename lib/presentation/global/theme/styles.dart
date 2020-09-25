import 'package:flutter/material.dart';

/// Snack Bar for AuthFailure and NoteSave
SnackBar snackBarBlack(String text, {int duration = 2}) {
  return SnackBar(
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: Duration(seconds: duration),
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
  );
}
