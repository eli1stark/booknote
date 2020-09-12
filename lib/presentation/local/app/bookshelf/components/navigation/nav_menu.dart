import '../../../categories/categories.dart';
import 'package:flutter/material.dart';
import '../../../about/about.dart';
import 'nav_item.dart';
import 'nav_title.dart';

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NavigationTitle('Booknote'),
        Divider(
          thickness: 0.2,
          color: Colors.grey,
        ),
        MenuItem(
          text: 'Categories',
          onTap: () {
            // close the Menu and go to the Categories
            Navigator.pop(context);
            Navigator.pushNamed(context, Categories.routeName);
          },
        ),
        MenuItem(
          text: 'About',
          onTap: () => showDialog(
            context: context,
            builder: (_) => appAboutDialog(),
          ),
        ),
        MenuItem(
          text: 'Sign out',
          onTap: () {},
        ),
      ],
    );
  }
}
