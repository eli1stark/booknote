import 'package:booknote/application/book/tracker_state_cubit.dart';
import 'package:booknote/domain/book/tracker_state.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/components/submit_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/ticker_text.dart';

// 2 issues with CupertinoPicker:
// 1) When Sliding too fast pages and pages < pagesRead
// pagesRead ticker disappearing, in order to fix I need to reopen the dialog
// This is only a UI problem, with State is everything okay
// 2) When pages and pagesRead are zero and I want to increase pages
// I can't increase pagesRead, in order to fix I need to reopen the dialog
// This is only a UI problem, with State is everything okay
class BookTracker extends StatelessWidget {
  BookTracker(
    this.book,
    this.uid,
  );

  final DocumentSnapshot book;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookTrackerCubit, TrackerState>(
      builder: (context, trackerState) {
        // Create 'BookTrackerCubit' instance
        BookTrackerCubit trackerCubit =
            BlocProvider.of<BookTrackerCubit>(context);

        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TickerText('Total pages'),
              Container(
                height: 90,
                width: 100,
                child: CupertinoPicker(
                  itemExtent: 30,
                  diameterRatio: 1,
                  scrollController: FixedExtentScrollController(
                    initialItem: trackerState.pages,
                  ),
                  onSelectedItemChanged: (value) =>
                      trackerCubit.updatePages(value, trackerState),
                  children: [
                    for (int i = 0; i < 2000; i++) Center(child: Text('$i'))
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TickerText('I\'m here'),
              Container(
                height: 140,
                width: 100,
                child: CupertinoPicker(
                  itemExtent: 30,
                  diameterRatio: 1,
                  scrollController: FixedExtentScrollController(
                    initialItem: trackerState.pagesRead,
                  ),
                  onSelectedItemChanged: (value) =>
                      trackerCubit.updatePagesRead(value, trackerState),
                  children: [
                    for (int i = 0; i <= trackerState.pages; i++)
                      Center(child: Text('$i'))
                  ],
                ),
              ),
              SubmitButton(
                text: 'OK',
                onPressed: () {
                  if (trackerState.pages < trackerState.pagesRead) {
                    trackerCubit.updateBothValues(trackerState.pages);

                    DatabaseService(uid: uid).updateBookPages(
                      book.documentID,
                      trackerState.pages,
                      trackerState.pages,
                    );
                  } else {
                    trackerCubit.updateSubmittedValues(
                      trackerState.pages,
                      trackerState.pagesRead,
                    );

                    DatabaseService(uid: uid).updateBookPages(
                      book.documentID,
                      trackerState.pages,
                      trackerState.pagesRead,
                    );
                  }

                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
