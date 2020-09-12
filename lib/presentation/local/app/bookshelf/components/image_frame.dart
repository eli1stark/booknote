import 'package:flutter/material.dart';
import '../../book/book.dart';

class ImageFrame extends StatelessWidget {
  ImageFrame({
    this.imagePath,
    this.networkImage,
  });

  final String imagePath;
  final bool networkImage;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.all(0),
      onPressed: () {
        Navigator.pushNamed(
          context,
          Book.routeName,
          arguments: BookArgument(imagePath),
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
          child: networkImage
              ? Image.network(
                  imagePath,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
}
