import 'package:flutter/material.dart';

class NavigationTitle extends StatelessWidget {
  NavigationTitle(
    this.title,
  );

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        top: 10.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Suez One',
          fontSize: 40.0,
        ),
      ),
    );
  }
}
