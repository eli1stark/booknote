import 'package:booknote/presentation/global/components/app_bar.dart';
import 'package:booknote/presentation/local/bookshelf/bookshelf.dart';
import 'package:flutter/material.dart';

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
