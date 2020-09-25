import 'package:booknote/presentation/global/theme/styles.dart';
import 'package:flutter/material.dart';

/// Getting result from SignOut methods and 
/// return snack bar in case of an error
signOutErrorCheck(BuildContext context, result) {
  // in case of an error
  if (result is String) {
    Navigator.pop(context);
    Scaffold.of(context).showSnackBar(
      snackBarBlack(result),
    );
  }
}
