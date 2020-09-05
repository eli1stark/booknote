import 'package:flutter/material.dart';

class BookAboutRow extends StatelessWidget {
  const BookAboutRow({
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
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            about,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
