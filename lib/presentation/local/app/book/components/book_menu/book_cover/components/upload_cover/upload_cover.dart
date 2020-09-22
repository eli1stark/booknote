import 'package:booknote/application/book/cover_state_cubit.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:flutter/material.dart';
import 'components/cover_hint.dart';
import 'components/upload_button.dart';

class UploadBookCover extends StatelessWidget {
  const UploadBookCover({
    this.onTap,
    this.coverCubit,
    this.database,
    this.documentID,
  });

  final Future Function(
    CoverStateCubit,
    DatabaseService,
    String,
  ) onTap;
  final CoverStateCubit coverCubit;
  final DatabaseService database;
  final String documentID;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text(
          '💡Hints: ',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        BookCoverHint(
          '1. The ideal size of your eBook cover is a height/width ratio of 1.6:1.',
        ),
        BookCoverHint(
          '2. Colored cover indicates selected one.',
        ),
        BookCoverHint(
          '3. You can upload one cover per book.',
        ),
        Expanded(
          child: SizedBox(),
        ),
        CoverUploadButton(
          onTap: onTap,
          coverCubit: coverCubit,
          database: database,
          documentID: documentID,
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
