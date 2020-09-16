import 'package:flutter/material.dart';
import '../../../../../global/components/tab_bar.dart';
import 'custom_tab.dart';

class TabsContainer extends StatelessWidget {
  const TabsContainer({
    @required this.controller,
    @required this.categories,
  });

  final TabController controller;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: double.infinity,
      height: 50.0,
      color: Colors.white,
      child: CustomTabBar(
        controller: controller,
        tabs: [
          for (Map category in categories)
            CustomTab(
              '${category['emoji'] + category['title']}',
            ),
        ],
      ),
    );
  }
}
