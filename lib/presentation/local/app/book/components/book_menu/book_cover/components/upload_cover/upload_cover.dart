import 'package:flutter/material.dart';
import 'components/cover_hint.dart';
import 'components/upload_button.dart';

class UploadBookCover extends StatelessWidget {
  const UploadBookCover(this.onTap);

  final Future Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          '2. Pink shadow indicates selected cover.',
        ),
        BookCoverHint(
          '3. You can upload one cover per book.',
        ),
        Expanded(
          child: SizedBox(),
        ),
        CoverUploadButton(onTap),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
