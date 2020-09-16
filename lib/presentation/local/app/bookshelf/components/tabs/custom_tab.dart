import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  CustomTab(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
