import 'package:flutter/material.dart';

/// FOR book_about and book_move pages
class BookMenuContentContainer extends Dialog {
  BookMenuContentContainer({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: size.height * 0.0293,
          bottom: size.height * 0.012,
          right: size.width * 0.0487,
          left: size.width * 0.0487,
        ),
        child: child,
      ),
    );
  }
}
