import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
// TODO download font 'itim'

class ItemTile extends StatelessWidget {
  const ItemTile({
    @required this.size,
    @required this.emoji,
    @required this.title,
    @required this.onEdit,
    @required this.onEmoji,
  });

  final Size size;
  final String emoji;
  final String title;
  final Function onEdit;
  final Function onEmoji;

  @override
  Widget build(BuildContext context) {
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
                Icons.tag_faces,
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
        style: GoogleFonts.itim(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
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
