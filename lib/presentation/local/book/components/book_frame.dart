import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookFrame extends StatelessWidget {
  BookFrame({
    @required this.size,
    @required this.imgSrc,
  });

  final Size size;
  final String imgSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              height: size.height * 0.35,
            ),
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // semanticContainer and clipBehavior allow Card to overflow image
                // and show its round corners
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // was asset when I used local images
                child: Image.network(
                  imgSrc,
                  height: size.height * 0.35,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: size.height * 0.35,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Icon(
                  FontAwesomeIcons.lockOpen,
                  size: 45.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
