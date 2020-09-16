import 'package:flutter/material.dart';
import '../../../global/components/big_title.dart';
import 'components/app_bar.dart';
import 'components/custom_gridview.dart';
import 'components/image_frame.dart';
import 'components/navigation/nav_menu.dart';
import 'components/tabs/custom_tab.dart';
import 'components/tabs/tab_divider.dart';
import 'components/tabs/tabs_container.dart';

class Bookshelf extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    TabController _controller;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            TabsContainer(
              controller: _controller,
              tabs: tabs,
            ),
            TabDivider(),
            Expanded(
              child: TabBarView(
                children: [
                  for (int i = 0; i < 2; i++) CustomGridView(books)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// MOCK:
List<Widget> tabs = [
  CustomTab('Text1'),
  CustomTab('Text2'),
];
// MOCK:
List<Widget> books = [
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
