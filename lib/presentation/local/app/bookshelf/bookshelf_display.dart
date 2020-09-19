import 'package:booknote/domain/categories/categories.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global/components/big_title.dart';
import 'components/app_bar.dart';
import 'components/custom_gridview.dart';
import 'components/image_frame.dart';
import 'components/navigation/nav_menu.dart';
import 'components/tabs/tab_divider.dart';
import 'components/tabs/tabs_container.dart';

class BookshelfDisplay extends StatelessWidget {
  BookshelfDisplay(this.uid);

  final String uid;

  @override
  Widget build(BuildContext context) {
    if (Provider.of<CategoriesData>(context) != null &&
        Provider.of<QuerySnapshot>(context) != null) {
      // get categories from the Firestore
      List categories = Provider.of<CategoriesData>(context).categories;

      // get books from the Firestore
      QuerySnapshot books = Provider.of<QuerySnapshot>(context);

      print(books);

      TabController _controller;
      return DefaultTabController(
        length: categories.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: bookshelfAppBar(context, categories, uid),
          drawer: Drawer(
            child: SafeArea(
              child: NavigationMenu(uid),
            ),
          ),
          body: Column(
            children: <Widget>[
              BigTitle(
                text: 'Bookshelf',
                size: 45.0,
              ),
              TabsContainer(
                controller: _controller,
                categories: categories,
              ),
              TabDivider(),
              Expanded(
                child: TabBarView(
                  children: [
                    for (int i = 0; i < 3; i++) CustomGridView(books1)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Loader();
    }
  }
}

// MOCK:
List<Widget> books1 = [
  ImageFrame(
    imagePath: 'images/samples/book-1.jpeg',
    networkImage: false,
  ),
  ImageFrame(
    imagePath: 'images/samples/book-2.jpeg',
    networkImage: false,
  ),
  ImageFrame(
    imagePath: 'images/samples/book-3.jpeg',
    networkImage: false,
  ),
  ImageFrame(
    imagePath: 'images/samples/book-4.png',
    networkImage: false,
  ),
  ImageFrame(
    imagePath: 'images/samples/book-5.png',
    networkImage: false,
  )
];
