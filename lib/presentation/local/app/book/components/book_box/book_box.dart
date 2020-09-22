import 'package:booknote/application/book/cover_state_cubit.dart';
import 'package:booknote/domain/book/cover_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'components/book_frame.dart';
import 'components/box_button.dart';
import '../book_tracker/components/show_dialog.dart';
import '../book_editor/book_editor.dart';

class BookBox extends StatelessWidget {
  BookBox(
    this.book,
    this.uid,
  );

  final DocumentSnapshot book;
  final String uid;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<CoverStateCubit, CoverState>(
        builder: (context, coverState) {
      return Container(
        height: size.height * 0.38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: BookBoxButton(
                icon: FontAwesomeIcons.thumbtack,
                onTap: () => showBookTrackerDialog(
                  context,
                  book,
                  uid,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: BookFrame(
                linkPath: coverState.selectedImage,
                network: coverState.network,
              ),
            ),
            // TODO connect BookEditor to the database
            Expanded(
              flex: 3,
              child: BookBoxButton(
                icon: FontAwesomeIcons.pencilAlt,
                onTap: () => Navigator.pushNamed(
                  context,
                  BookEditor.routeName,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
