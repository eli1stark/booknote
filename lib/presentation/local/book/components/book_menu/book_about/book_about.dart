import 'package:flutter/material.dart';
import 'components/about_close.dart';
import 'components/about_row.dart';
import '../components/content_container.dart';

Dialog aboutBookDialog(BuildContext context) {
  return BookMenuContentContainer(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookAboutRow(
          title: 'Title:',
          about: '"Hello Dad"',
        ),
        BookAboutRow(
          title: 'Authors:',
          about: 'Karen Bali',
        ),
        BookAboutRow(
          title: 'Publisher:',
          about: 'WritersPrintShop',
        ),
        BookAboutRow(
          title: 'Categories:',
          about: 'Father and child',
        ),
        BookAboutRow(
          title: 'Published:',
          about: '2004',
        ),
        BookAboutRow(
          title: 'Pages:',
          about: '59',
        ),
        BookAboutClose()
      ],
    ),
  );
}
