import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigTitle extends StatelessWidget {
  BigTitle({this.text, this.size});

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          bottom: 5.0,
        ),
        child: Text(
          text,
          style: GoogleFonts.suezOne(
            fontSize: size,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
