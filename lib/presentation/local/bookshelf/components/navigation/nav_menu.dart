import 'package:booknote/presentation/local/categories/categories.dart';
import 'package:flutter/material.dart';
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
            // close the menu
            Navigator.pop(context);
            // go to the page
            Navigator.pushNamed(context, Categories.routeName);
          },
        ),
        MenuItem(
          text: 'Pallete',
          onTap: () {},
        ),
        MenuItem(
          text: 'TEST',
          onTap: () {
            // close the menu
            Navigator.pop(context);
            // go to the page
            Navigator.pushNamed(context, '/test');
          },
        ),
      ],
    );
  }
}
