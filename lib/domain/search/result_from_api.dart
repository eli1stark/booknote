import 'package:flutter/material.dart';

class ResultFromAPI {
  ResultFromAPI({
    @required this.bookID,
    @required this.title,
    @required this.authors,
    @required this.publisher,
    @required this.categoryType,
    @required this.published,
    @required this.pages,
    @required this.linkToNetworkThumbnailCover,
  });

  final String bookID;
  final String title;
  final String authors;
  final String publisher;
  final String categoryType;
  final String published;
  final int pages;
  final String linkToNetworkThumbnailCover;
}
