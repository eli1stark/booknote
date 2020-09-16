import 'package:flutter/material.dart';
import '../../../../../global/components/tab_bar.dart';

class TabsContainer extends StatelessWidget {
  const TabsContainer({
    @required this.controller,
    @required this.tabs,
  });

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: double.infinity,
      height: 50.0,
      color: Colors.white,
      child: CustomTabBar(
        controller: controller,
        tabs: tabs,
      ),
    );
  }
}
