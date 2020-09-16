import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/auth/user.dart';
import '../app/bookshelf/bookshelf.dart';
import '../auth/authentication.dart';

/// controls whether a user is authenticated
class Controller extends StatelessWidget {
  static const routeName = '/controller';

  @override
  Widget build(BuildContext context) {
    // return either Auth or App
    if (Provider.of<AppUser>(context) != null) {
      return Bookshelf();
    } else {
      return Authentication();
    }
  }
}
