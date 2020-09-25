/// [pages] and [pagesRead] track submitted state \
/// and dismissed state (when dialog was closed without 'OK' button) \
/// [submittedPages] and [submittedPagesRead] track \
/// only submitted state (the state which was saved to the Firestore) \
/// I need to differentiate between them so when Dialog WillPopUp, \
/// I restore [pages] and [pagesRead] to the state which is equal 
/// to the state in the database.
class TrackerState {
  TrackerState({
    this.pages,
    this.pagesRead,
    this.submittedPages,
    this.submittedPagesRead,
  });

  final int pages;
  final int pagesRead;
  final int submittedPages;
  final int submittedPagesRead;
}
