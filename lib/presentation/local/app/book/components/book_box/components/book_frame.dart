import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookFrame extends StatelessWidget {
  const BookFrame(this.currentImage);

  final Map currentImage;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.topCenter,
      child: Card(
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
        child: currentImage['network']
            ? CachedNetworkImage(
                imageUrl: currentImage['linkPath'],
                height: size.height * 0.35,
                fit: BoxFit.fill,
              )
            : Image.file(
                File(currentImage['linkPath']),
                height: size.height * 0.35,
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
