import 'package:booknote/domain/auth/user.dart';
import 'package:booknote/domain/categories/categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../infrastructure/database/database.dart';
import '../../../global/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bookshelf_display.dart';

class Bookshelf extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppUser>(context) != null) {
      // get user ID from the Stream
      String uid = Provider.of<AppUser>(context).uid;

      // disable Android back button on Auth Page to prevent crash
      // related to the Auth Stream (problems with the package)
      return WillPopScope(
        onWillPop: () async => false,
        // configure MultiProvider for Bookshelf
        child: MultiProvider(
          providers: [
            StreamProvider<CategoriesData>.value(
              value: DatabaseService(uid: uid).categories,
            ),
            StreamProvider<QuerySnapshot>.value(
              value: DatabaseService(uid: uid).books,
            ),
          ],
          child: BookshelfDisplay(uid),
        ),
      );
    } else {
      return Loader();
    }
  }
}
