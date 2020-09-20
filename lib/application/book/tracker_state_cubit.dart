import 'package:booknote/domain/book/tracker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookTrackerCubit extends Cubit<TrackerState> {
  BookTrackerCubit(int pages, int pagesRead)
      : super(
          TrackerState(
            pages: pages,
            pagesRead: pagesRead,
            submittedPages: pages,
            submittedPagesRead: pagesRead,
          ),
        );

  void updatePages(int pages, TrackerState state) {
    emit(TrackerState(
      pages: pages,
      pagesRead: state.pagesRead,
      submittedPages: state.submittedPages,
      submittedPagesRead: state.submittedPagesRead,
    ));
  }

  void updatePagesRead(int pagesRead, TrackerState state) {
    emit(TrackerState(
      pages: state.pages,
      pagesRead: pagesRead,
      submittedPages: state.submittedPages,
      submittedPagesRead: state.submittedPagesRead,
    ));
  }

  /// When data saves to the Firestore \
  /// and pages < pagesRead \
  void updateBothValues(int value) {
    emit(TrackerState(
      pages: value,
      pagesRead: value,
      submittedPages: value,
      submittedPagesRead: value,
    ));
  }

  /// When data saves to the Firestore \
  /// and pages < pagesRead is not TRUE. \
  /// I only need this for SubmittedValues,
  /// but because I need to fill pages and pagesRead,
  /// I'm also passing data to them.
  void updateSubmittedValues(int pages, int pagesRead) {
    emit(TrackerState(
      pages: pages,
      pagesRead: pagesRead,
      submittedPages: pages,
      submittedPagesRead: pagesRead,
    ));
  }

  /// On WillPopScope of the Dialog
  void restoreBothValues(int submittedPages, int submittedPagesRead) {
    emit(TrackerState(
      pages: submittedPages,
      pagesRead: submittedPagesRead,
      submittedPages: submittedPages,
      submittedPagesRead: submittedPagesRead,
    ));
  }
}
