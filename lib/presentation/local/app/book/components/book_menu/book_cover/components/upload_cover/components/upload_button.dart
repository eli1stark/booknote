import 'package:booknote/application/book/cover_state_cubit.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/components/submit_button.dart';
import 'package:flutter/material.dart';

class CoverUploadButton extends StatelessWidget {
  const CoverUploadButton({
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
    return Center(
      child: SubmitButton(
        text: 'UPLOAD IMAGE',
        size: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        onPressed: () => onTap(
          coverCubit,
          database,
          documentID,
        ),
      ),
    );
  }
}
