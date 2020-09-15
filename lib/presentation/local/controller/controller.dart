import 'package:flutter/material.dart';
import 'package:booknote/infrastructure/auth/auth.dart';
import 'package:booknote/domain/auth/user.dart';
import '../app/bookshelf/bookshelf.dart';
import '../auth/authentication.dart';

/// controls whether a user is authenticated
class Controller extends StatelessWidget {
  static const routeName = '/controller';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser>(
      stream: AuthService().user,
      builder: (context, snapshot) {
        // return either Auth or App
        if (snapshot.data != null)
          return Bookshelf();
        else
          return Authentication();
      },
    );
  }
}
