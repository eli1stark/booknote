import 'package:flutter/material.dart';
import 'image_frame.dart';

class CustomGridView extends StatefulWidget {
  CustomGridView(this.sortedBooks);

  final List<ImageFrame> sortedBooks;

  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

/// AutomaticKeepAliveClientMixin helps to not rebuild
/// Grid every time it appears on the screen.
/// It builds it only once.
class _CustomGridViewState extends State<CustomGridView>
    with AutomaticKeepAliveClientMixin {
  // getter for AutomaticKeepAliveClientMixin
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // build for AutomaticKeepAliveClientMixin
    super.build(context);
    return Card(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          bottom: 10.0,
        ),
        childAspectRatio: (70 / 100),
        children: widget.sortedBooks,
      ),
    );
  }
}
