import 'package:flutter/material.dart';

/// Search AppBar Field Decoration
const searchFieldDecoration = InputDecoration(
  hintText: 'Search books, authors',
  fillColor: Colors.black12,
  filled: true,
  contentPadding: EdgeInsets.all(15.0),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: const BorderRadius.all(
      const Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: const BorderRadius.all(
      const Radius.circular(10.0),
    ),
  ),
  suffixIcon: Icon(
    Icons.search,
    color: Colors.grey,
  ),
);
