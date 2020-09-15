import 'package:booknote/domain/categories/categories.dart';
import 'package:booknote/presentation/global/components/alert_info.dart';
import 'package:booknote/presentation/global/components/big_title.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';
import 'components/image_frame.dart';
import 'components/custom_gridview.dart';
import 'components/tabs/tab_divider.dart';
import 'components/navigation/nav_menu.dart';
import 'components/tabs/tabs_container1.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bookshelf1 extends StatefulWidget {
  static const routeName = '/1';

  @override
  _Bookshelf1State createState() => _Bookshelf1State();
}

class _Bookshelf1State extends State<Bookshelf1> with TickerProviderStateMixin {
  TabController _controller;

  Widget processBooks(
    Map category,
    List booksFromDatabase,
    Size size,
  ) {
    // declare new list
    List<Widget> books = [];

    // iterate through all books
    for (var book in booksFromDatabase) {
      if (book['categoryID'] == category['id']) {
        if (book['networkImage'] != null) {
          books.add(
            ImageFrame(
              imagePath: '${book['networkImage']}',
              networkImage: true,
            ),
          );
        } else {
          books.add(
            ImageFrame(
              imagePath: 'images/samples/${book['imagePath']}',
              networkImage: false,
            ),
          );
        }
      }
    }

    // If list is empty, else
    if (books.length == 0) {
      return Card(
        child: AlertInfo(
          image: 'images/no_content.png',
          text: 'No Content!',
          size: size,
        ),
      );
    } else {
      return Card(
        child: CustomGridView(
          books: books,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    // Checking whether data arrived
    if (Provider.of<CategoriesData>(context) != null &&
        Provider.of<QuerySnapshot>(context) != null) {
      // Getting data ('categories') from the Stream using Provider
      var categories = Provider.of<CategoriesData>(context).categories;

      // Getting all documents from 'books' collection using Provider
      var booksFromDatabase = Provider.of<QuerySnapshot>(context).documents;

      // Tabs controller
      _controller = TabController(length: categories.length, vsync: this);

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: bookshelfAppBar(context),
        drawer: Drawer(
          child: SafeArea(
            child: NavigationMenu(),
          ),
        ),
        body: Column(
          children: <Widget>[
            BigTitle(
              text: 'Bookshelf',
              size: 45.0,
            ),
            TabsContainer1(
              controller: _controller,
              categories: categories,
            ),
            TabDivider(),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  for (Map category in categories)
                    processBooks(category, booksFromDatabase, size),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Loader();
    }
  }
}
