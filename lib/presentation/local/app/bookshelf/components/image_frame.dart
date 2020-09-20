import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../book/book.dart';

class ImageFrame extends StatelessWidget {
  ImageFrame({
    @required this.linkPath,
    @required this.network,
    @required this.book,
    @required this.uid,
    @required this.currentCategory,
    @required this.categories,
  });

  final String linkPath;
  final bool network;
  final DocumentSnapshot book;
  final String uid;
  final Map currentCategory;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pushNamed(
          context,
          Book.routeName,
          arguments: BookArgument(
            book: book,
            uid: uid,
            currentCategory: currentCategory,
            categories: categories,
          ),
        );
      },
      child: SizedBox.expand(
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // semanticContainer and clipBehavior allow Card to overflow image
          // and show its round corners
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: network
              ? Image.network(
                  linkPath,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  linkPath,
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
}
