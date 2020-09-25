import 'package:booknote/presentation/global/components/submit_button.dart';
import 'package:flutter/material.dart';

class BookAboutClose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SubmitButton(
        text: 'CLOSE',
        size: 18.0,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
