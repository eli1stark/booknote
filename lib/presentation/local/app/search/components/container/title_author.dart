import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TitleAuthorText extends StatelessWidget {
  const TitleAuthorText({
    @required this.text,
    @required this.fontSize,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}
