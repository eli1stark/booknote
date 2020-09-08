import 'package:booknote/presentation/local/book/components/book_tracker/book_tracker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/book_frame.dart';
import 'components/box_button.dart';

class BookBox extends StatelessWidget {
  BookBox({@required this.imgSrc});

  final String imgSrc;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: BookBoxButton(
              icon: FontAwesomeIcons.thumbtack,
              // TODO add book tracker functionality
              onTap: () => showDialog(
                context: context,
                builder: (_) => bookTrackerDialog(_),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.topCenter,
              child: BookFrame(
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
            child: BookBoxButton(
              icon: FontAwesomeIcons.pencilAlt,
              // TODO add note editor functionality
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
