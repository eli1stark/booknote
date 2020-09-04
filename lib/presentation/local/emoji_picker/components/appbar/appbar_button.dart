import 'package:flutter/material.dart';
import 'appbar_text.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    this.text,
    this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: AppBarText(
          text: text,
        ),
      ),
      onTap: onTap,
    );
  }
}
