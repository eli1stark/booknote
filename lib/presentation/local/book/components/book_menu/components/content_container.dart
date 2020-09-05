import 'package:flutter/material.dart';

class BookMenuContentContainer extends Dialog {
  BookMenuContentContainer({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.0293,
          horizontal: size.width * 0.0487,
        ),
        child: child,
      ),
    );
  }
}