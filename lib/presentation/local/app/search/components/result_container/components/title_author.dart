import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TitleAuthorText extends StatelessWidget {
  const TitleAuthorText({
    @required this.text,
    this.title = false,
  });

  final String text;
  final bool title;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: title ? 2 : 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: title ? 17.0 : 15.0,
      ),
    );
  }
}
