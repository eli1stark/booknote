import 'package:booknote/presentation/global/components/app_bar.dart';
import 'package:flutter/material.dart';

class BookCoverAppBar extends StatelessWidget {
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
