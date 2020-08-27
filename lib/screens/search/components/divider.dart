import 'package:flutter/material.dart';

class SearchResultDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 1.5,
      color: Colors.grey,
      indent: 10.0,
      endIndent: 10.0,
    );
  }
}
