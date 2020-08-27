import 'package:flutter/material.dart';
import 'package:booknote/components/app_bar.dart';

class CategoryAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      fontAwesome: false,
      onTapLeft: () {
        Navigator.pop(context);
      },
    );
  }
}
