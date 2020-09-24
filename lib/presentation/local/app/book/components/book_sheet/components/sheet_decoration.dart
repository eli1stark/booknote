import 'package:flutter/material.dart';

class BookSheetDecoration extends StatelessWidget {
  BookSheetDecoration({
    this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 0.0,
        right: 0.0,
        bottom: 10.0,
        top: 6.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        border: Border.all(
          color: Colors.grey[500].withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: child,
    );
  }
}
