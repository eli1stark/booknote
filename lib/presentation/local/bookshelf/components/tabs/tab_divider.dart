import 'package:flutter/material.dart';

class TabDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.0,
      color: Colors.grey,
      indent: 20.0,
      endIndent: 20.0,
    );
  }
}
