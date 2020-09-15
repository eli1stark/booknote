import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  CustomGridView({
    @required this.books,
  });

  final List<Widget> books;

  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          bottom: 10.0,
        ),
        childAspectRatio: (70 / 100),
        children: widget.books,
      ),
    );
  }
}
