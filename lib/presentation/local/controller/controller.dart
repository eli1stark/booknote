import 'package:booknote/infrastructure/auth/auth.dart';
import '../../global/components/loader.dart';
import 'package:flutter/material.dart';
import '../../../domain/auth/user.dart';
import '../app/bookshelf/bookshelf.dart';
import '../auth/authentication.dart';

/// controls whether an user is authenticated
class Controller extends StatelessWidget {
  static const routeName = '/controller';

  @override
  Widget build(BuildContext context) {
    // return either Auth, App or Loader
    return StreamBuilder<AppUser>(
      stream: AuthService().user,
      builder: (context, snapshot) {
        // stream data is already arrived
        if (snapshot.connectionState == ConnectionState.active) {
          AppUser user = snapshot.data;
          if (user == null) {
            return Authentication();
          }
          return Bookshelf();
        }
        // connectionState.waiting (for data)
        else {
          return Loader();
        }
      },
    );
  }
}
