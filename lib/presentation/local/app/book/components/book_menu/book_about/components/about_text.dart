import 'package:flutter/material.dart';

class AboutRichText extends StatelessWidget {
  const AboutRichText({
    Key key,
    this.title,
    this.about,
  }) : super(key: key);

  final String title;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: title + '  ',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Lato',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: about,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
