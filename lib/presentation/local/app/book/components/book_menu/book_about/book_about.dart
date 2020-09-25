import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'components/about_close.dart';
import 'components/about_text.dart';
import '../components/content_container.dart';

Dialog aboutBookDialog(
  DocumentSnapshot book,
) {
  return BookMenuContentContainer(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AboutRichText(
          title: 'Title:',
          about: book['title'],
        ),
        AboutRichText(
          title: 'Authors:',
          about: book['authors'],
        ),
        AboutRichText(
          title: 'Publisher:',
          about: book['publisher'],
        ),
        AboutRichText(
          title: 'Categories:',
          about: book['categoryType'],
        ),
        AboutRichText(
          title: 'Published:',
          about: book['published'],
        ),
        // TODO make pages reflect on changes in BookTracker
        // I just need to pass state of the Cubit there
        AboutRichText(
          title: 'Pages:',
          about: book['pages'].toString(),
        ),
        BookAboutClose(),
      ],
    ),
  );
}
