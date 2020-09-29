import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    @required this.title,
    @required this.text,
    this.halfWidth = false,
  });

  final String title;
  final String text;
  final bool halfWidth;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        // prevent Text overflow the "Add" button with Container width
        Container(
          width: halfWidth ? size.width * 0.2 : size.width * 0.35,
          child: AutoSizeText(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
