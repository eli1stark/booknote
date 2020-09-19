import 'package:booknote/domain/categories/categories.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/components/big_title.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'components/floating_button.dart';
import 'components/app_bar.dart';
import 'components/item_tile.dart';
import 'components/edit_form/edit_sheet.dart';

class CategoriesDisplay extends StatefulWidget {
  CategoriesDisplay(this.uid);

  final String uid;

  @override
  _CategoriesDisplayState createState() => _CategoriesDisplayState();
}

class _CategoriesDisplayState extends State<CategoriesDisplay> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<CategoriesData>(context) != null &&
        Provider.of<QuerySnapshot>(context) != null) {
      // get categories data from the Firestore
      List categories = Provider.of<CategoriesData>(context).categories;
      int idCounter = Provider.of<CategoriesData>(context).idCounter;

      // get books from the Firestore
      List<DocumentSnapshot> books = Provider.of<QuerySnapshot>(context).documents;

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CategoryAppBar(),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        floatingActionButton: FloatingAddButton(
          categories,
          idCounter,
          widget.uid,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              BigTitle(
                text: 'Categories',
                size: 45.0,
              ),
              Expanded(
                child: ReorderableListView(
                  children: <Widget>[
                    for (final item in categories)
                      Card(
                        key: ValueKey(item['indexKey']),
                        elevation: 2,
                        child: ItemTile(
                          emoji: item['emoji'],
                          onEmoji: () {
                            Navigator.pushNamed(
                              context,
                              EmojiPicker.routeName,
                              arguments: EmojiPickerArgument(
                                item: item,
                                categories: categories,
                                status: 'update',
                              ),
                            );
                          },
                          title: item['title'],
                          onEdit: () => showSettingsPanel(
                            context,
                            item,
                            categories,
                            books,
                            widget.uid,
                          ),
                        ),
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      // To avoid range error
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }

                      // reorder list of categories
                      final item = categories.removeAt(oldIndex);
                      categories.insert(newIndex, item);

                      // update keys according to index of every map
                      for (int i = 0; i < categories.length; i++) {
                        categories[i]['indexKey'] = i;
                      }

                      // update Firestore
                      DatabaseService(uid: widget.uid)
                          .updateCategories(categories);
                    });
                  },
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
