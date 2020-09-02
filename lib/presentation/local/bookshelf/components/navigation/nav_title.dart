import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationTitle extends StatelessWidget {
  NavigationTitle(
    this.title,
  );

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        top: 10.0,
      ),
      child: Text(
        title,
        // TODO load font
        style: GoogleFonts.suezOne(
          fontSize: 40.0,
        ),
      ),
    );
  }
}
