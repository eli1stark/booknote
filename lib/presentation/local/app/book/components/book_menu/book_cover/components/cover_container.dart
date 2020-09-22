import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCoverContainer extends StatelessWidget {
  const BookCoverContainer({
    Key key,
    @required this.linkPath,
    @required this.network,
    @required this.onTap,
    @required this.opacity,
  }) : super(key: key);

  final String linkPath;
  final bool network;
  final Function onTap;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          // semanticContainer and clipBehavior allow Card to overflow image
          // and show its round corners
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: network
              ? CachedNetworkImage(
                  imageUrl: linkPath,
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  fit: BoxFit.fill,
                  fadeInCurve: Curves.easeIn,
                  // fixed width will prevent wide
                  // images to take a lot of space
                  width: 200,
                )
              : Image.file(
                  File(linkPath),
                  fit: BoxFit.fill,
                  width: 200,
                ),
        ),
      ),
    );
  }
}
