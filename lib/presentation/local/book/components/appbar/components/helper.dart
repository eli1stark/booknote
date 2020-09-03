import 'constants.dart';

/// Takes MenuAction in BookPage and perform some action
void onSelected(String action) {
  if (action == MenuActions.cover) {
    print('cover');
  } else if (action == MenuActions.about) {
    print('about');
  } else if (action == MenuActions.move) {
    print('move');
  } else if (action == MenuActions.delete) {
    print('delete');
  }
}
