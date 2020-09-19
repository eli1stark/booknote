import 'package:booknote/infrastructure/auth/auth.dart';
import '../../../categories/categories.dart';
import 'package:flutter/material.dart';
import '../../../about/about.dart';
import 'nav_item.dart';
import 'nav_title.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu(this.uid);

  final String uid;

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
            Navigator.pushNamed(
              context,
              Categories.routeName,
              arguments: CategoriesArgument(uid),
            );
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
          onTap: () async => await AuthService().signOut(),
        ),
      ],
    );
  }
}
