import 'package:booknote/components/tab_bar.dart';
import 'package:flutter/material.dart';
import 'components/appbar/app_bar.dart';
import 'components/emoji_gridview.dart';
import 'components/emoji_lists.dart';

class EmojiPickerArgument {
  EmojiPickerArgument({
    @required this.item,
    this.categories,
    @required this.status,
  });

  /// Single category
  final Map item;

  /// List of added categories
  final List categories;

  /// Can be only 'add' or 'update'
  final String status;
}

class EmojiPicker extends StatefulWidget {
  static const routeName = '/emoji_picker';

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    // Get Arguments from Categories page (single item and whole list)
    EmojiPickerArgument arg = ModalRoute.of(context).settings.arguments;

    // WillPopScope will prevent the page from being popped by the system.
    // I'll still be able to use Navigator.pop(context)
    return WillPopScope(
      // if I came from AddForm then disable Android Back Button
      onWillPop: arg.status == 'update' ? () async => true : () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: EmojiPickerAppBar(
            item: arg.item,
            categories: arg.categories,
            status: arg.status,
          ),
          preferredSize: Size.fromHeight(size.height * 0.057),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  children: [
                    for (Map map in emojiMapName.values)
                      EmojiGridView(
                        emojiMap: map,
                        item: arg.item,
                        categories: arg.categories,
                        status: arg.status,
                      ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.055,
                child: CustomTabBar(
                  controller: _controller,
                  tabs: [
                    for (IconData icon in emojiMapIcon.values)
                      Tab(
                        icon: Icon(
                          icon,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
