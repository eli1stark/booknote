import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../styles.dart';

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.073,
      decoration: googleButtonDecoration,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.google,
              size: 25.0,
            ),
            SizedBox(
              width: size.width * 0.0255,
            ),
            Text(
              'Continue with Google',
              style: googleButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
