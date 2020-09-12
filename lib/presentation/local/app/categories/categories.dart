import 'package:booknote/domain/categories/categories.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/components/big_title.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import '../emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/app_bar.dart';
import 'components/item_tile.dart';
import 'components/add_form/add_sheet.dart';
import 'components/edit_form/edit_sheet.dart';

class Categories extends StatefulWidget {
  static const routeName = '/categories';

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    // Checking whether data arrived
    if (Provider.of<CategoriesData>(context) != null) {
      // Getting data from the Stream using Provider
      var categories = Provider.of<CategoriesData>(context).categories;
      int idCounter = Provider.of<CategoriesData>(context).idCounter;

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CategoryAppBar(),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {
            // show dialog form to add new Category
            dialogFormToAddNewCategory(context, categories, idCounter);
          },
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
                          size: size,
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
                          onEdit: () =>
                              showSettingsPanel(context, item, categories),
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
                      DatabaseService().updateCategories(categories);
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

// TODO restrict emoji in TextFiled in AddForm()
// TODO ask user: Are you sure you wnat to delete this category?
// TODO when one category left restrict delete of it
// TODO restrict duplicated categories, (This category already exists) because of Dropdown menu in Search page
// TODO restrict size of the category to 20 chars maybe less
