import 'package:booknote/screens/bookshelf/bookshelf.dart';
import 'package:flutter/material.dart';
import 'package:booknote/components/app_bar.dart';

class BookAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      iconRight: Icons.subject,
      fontAwesome: false,
      onTapLeft: () => Navigator.pushNamed(
        context,
        Bookshelf.routeName,
      ),
      onTapRight: () {},
    );
  }
}
