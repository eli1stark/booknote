import 'package:booknote/infrastructure/auth/auth.dart';
import 'package:booknote/presentation/global/theme/styles.dart';
import 'package:flutter/material.dart';
import '../../../../global/components/submit_button.dart';
import '../helpers.dart';
import '../styles.dart';

Dialog forgotPasswordDialog(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  String _email;

  return Dialog(
    shape: forgotPasswordDialogShape,
    child: Container(
      padding: forgotPasswordDialogPadding,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              style: forgotPasswordFieldStyle,
              textInputAction: TextInputAction.done,
              decoration: authFieldDecoration(true),
              validator: (value) => emailValidator(value) ? null : emailHint,
              onChanged: (value) => _email = value,
            ),
            SizedBox(
              height: 20.0,
            ),
            SubmitButton(
              text: 'Recover',
              size: 20.0,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result =
                      await AuthService().resetUserPassword(_email);

                  // in case of an error
                  if (result is String) {
                    Navigator.pop(context);
                    Scaffold.of(context).showSnackBar(
                      snackBarBlack(result),
                    );
                  } else {
                    Navigator.pop(context);
                    Scaffold.of(context).showSnackBar(
                      snackBarBlack(
                        'A password reset link has been sent to $_email',
                        duration: 4,
                      ),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
    ),
  );
}
