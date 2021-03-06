import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../application/book/tracker_state_cubit.dart';
import 'components/about_close.dart';
import 'components/about_text.dart';
import '../components/content_container.dart';

Dialog aboutBookDialog({
  BuildContext bookContext,
  DocumentSnapshot book,
}) {
  // Create 'BookTrackerCubit' instance
  BookTrackerCubit trackerCubit =
      BlocProvider.of<BookTrackerCubit>(bookContext);

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
        AboutRichText(
          title: 'Pages:',
          about: trackerCubit.state.pages.toString(),
        ),
        BookAboutClose(),
      ],
    ),
  );
}
