import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookMenuIcon extends StatelessWidget {
  const BookMenuIcon(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: icon == FontAwesomeIcons.solidTrashAlt
          ? Colors.red[300]
          : Colors.black,
      size: 25.0,
    );
  }
}
