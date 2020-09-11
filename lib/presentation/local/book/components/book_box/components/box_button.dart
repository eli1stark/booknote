import 'package:flutter/material.dart';

class BookBoxButton extends StatelessWidget {
  const BookBoxButton({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          highlightColor: Colors.transparent,
          customBorder: CircleBorder(),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              icon,
              size: 45.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
