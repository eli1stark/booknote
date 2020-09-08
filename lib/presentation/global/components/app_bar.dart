import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainAppBar extends StatelessWidget {
  MainAppBar({
    this.iconRight,
    this.fontAwesome,
    this.onTapLeft,
    this.onTapRight,
  });

  final IconData iconRight;
  final bool fontAwesome;
  final Function onTapLeft;
  final Function onTapRight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        highlightColor: Colors.transparent,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 35.0,
        ),
        onPressed: onTapLeft,
      ),
      actions: <Widget>[
        IconButton(
          highlightColor: Colors.transparent,
          icon: fontAwesome
              ? FaIcon(
                  iconRight,
                  color: Colors.black,
                  size: 35.0,
                )
              : Icon(
                  iconRight,
                  color: Colors.black,
                  size: 35.0,
                ),
          onPressed: onTapRight,
        )
      ],
    );
  }
}
