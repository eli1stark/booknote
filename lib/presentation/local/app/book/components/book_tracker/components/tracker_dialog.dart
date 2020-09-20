import 'package:booknote/application/book/tracker_state_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../book_tracker.dart';

WillPopScope bookTrackerDialog(
  BuildContext context,
  DocumentSnapshot book,
  String uid,
) {
  // Create 'BookTrackerCubit' instance
  BookTrackerCubit trackerCubit = BlocProvider.of<BookTrackerCubit>(context);

  // There are 3 ways to close a dialog: \
  // 1. Pressing some button on the dialog that closes it. \
  // 2. Tapping the barrier. \
  // 3. Pressing the Android back button. \
  // In order to control '2' and '3' I need WillPopScope(). \
  // IF '2' and '3' I need restore BookTrackerCubit to values from the Firestore
  return WillPopScope(
    onWillPop: () {
      trackerCubit.restoreBothValues(
        trackerCubit.state.submittedPages,
        trackerCubit.state.submittedPagesRead,
      );
      // if value is false then the dialog won't be closed
      // unlees I press 'OK' button inside it
      return Future.value(true);
    },
    child: Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: BookTracker(book, uid),
    ),
  );
}
