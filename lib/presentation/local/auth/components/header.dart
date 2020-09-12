import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Image.asset(
          'images/cole-welcome.png',
        ),
      ),
    );
  }
}
