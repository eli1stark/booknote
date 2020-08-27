import 'package:booknote/components/tab_bar.dart';
import 'package:flutter/material.dart';
import 'custom_tab.dart';

class TabsContainer extends StatelessWidget {
  const TabsContainer({
    @required TabController controller,
    @required this.categories,
  }) : _controller = controller;

  final TabController _controller;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: double.infinity,
      height: 50.0,
      color: Colors.white,
      child: CustomTabBar(
        controller: _controller,
        tabs: [
          // iterate through all categories
          for (Map category in categories)
            CustomTab(
              '${category['emoji'] + category['title']}',
            ),
        ],
      ),
    );
  }
}
