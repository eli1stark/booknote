import 'package:flutter/material.dart';

class BookFrame extends StatelessWidget {
  const BookFrame({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // semanticContainer and clipBehavior allow Card to overflow image
      // and show its round corners
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: child,
    );
  }
}
