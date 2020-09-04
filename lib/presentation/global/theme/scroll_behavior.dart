import 'package:flutter/material.dart';

// removing  GlowingOverscrollIndicator (shadow when overscroll)
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
