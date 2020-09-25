import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeleteButton extends StatelessWidget {
  DeleteButton({
    @required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.grey[200],
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: FaIcon(
            FontAwesomeIcons.trashAlt,
            color: Colors.black,
            size: 35.0,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
