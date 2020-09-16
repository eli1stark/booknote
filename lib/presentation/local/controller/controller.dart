import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/auth/user.dart';
import '../../../domain/categories/categories.dart';
import '../../../infrastructure/auth/auth.dart';
import '../../../infrastructure/database/database.dart';
import '../app/bookshelf/bookshelf.dart';
import '../auth/authentication.dart';

/// controls whether a user is authenticated
class Controller extends StatelessWidget {
  static const routeName = '/controller';

  @override
  Widget build(BuildContext context) {
    // User data goes down the Stream using Multiprovider
    return MultiProvider(
      providers: [
        StreamProvider<CategoriesData>.value(
          value: DatabaseService().categories,
        ),
        StreamProvider<QuerySnapshot>.value(
          value: DatabaseService().books,
        ),
        StreamProvider<AppUser>.value(
          value: AuthService().user,
        ),
      ],
      // return either Auth or App
      child: Provider.of<AppUser>(context) != null
          ? Bookshelf()
          : Authentication(),
    );
  }
}
