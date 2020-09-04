import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({
    @required this.books,
  });

  final List<Widget> books;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      childAspectRatio: (70 / 100),
      children: books,
    );
  }
}
