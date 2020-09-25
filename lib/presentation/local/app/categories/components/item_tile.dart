import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    @required this.emoji,
    @required this.title,
    @required this.onEdit,
    @required this.onEmoji,
  });

  final String emoji;
  final String title;
  final Function onEdit;
  final Function onEmoji;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return ListTile(
      leading: InkWell(
        child: emoji != ''
            // if there is emoji
            ? Text(
                emoji,
                style: TextStyle(
                  fontSize: size.width * 0.09,
                ),
              )
            // if there is no emoji
            : Icon(
                FontAwesomeIcons.smile,
                size: size.width * 0.11,
                color: Colors.black,
              ),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onTap: onEmoji,
      ),
      title: AutoSizeText(
        title,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30.0,
          letterSpacing: 1.0,
          fontFamily: 'Itim',
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Material(
        shape: CircleBorder(),
        color: Colors.white,
        child: InkWell(
          customBorder: CircleBorder(),
          splashColor: Colors.black12,
          highlightColor: Colors.black12,
          onTap: onEdit,
          child: Icon(
            Icons.edit,
            size: size.width * 0.11,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
