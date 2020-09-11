import 'package:booknote/presentation/global/components/app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

// TODO remove
class EditorAppBar extends StatelessWidget {
  EditorAppBar({this.onTapRight});

  final Function onTapRight;

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      fontAwesome: true,
      iconRight: FontAwesomeIcons.save,
      onTapLeft: () {
        Navigator.pop(context);
      },
      onTapRight: (context) {
        onTapRight(context);
      },
    );
  }
}
