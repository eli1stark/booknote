import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PagesDateText extends StatelessWidget {
  const PagesDateText({
    @required this.size,
    @required this.text,
  });

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.37,
      child: AutoSizeText(
        text,
        maxLines: 1,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
