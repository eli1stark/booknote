import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookTracker extends StatefulWidget {
  @override
  _BookTrackerState createState() => _BookTrackerState();
}

class _BookTrackerState extends State<BookTracker> {
  int totalPages = 150;
  int iAmHere = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total pages',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Container(
            height: 90,
            width: 100,
            child: CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() => totalPages = value);
              },
              children: [
                for (int i = 0; i < 2000; i++) Center(child: Text('$i'))
              ],
              diameterRatio: 1,
              scrollController: FixedExtentScrollController(
                initialItem: totalPages,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'I\'m here',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Container(
            height: 140,
            width: 100,
            child: CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (value) {
                setState(() => iAmHere = value);
              },
              children: [
                for (int i = 0; i < totalPages + 1; i++)
                  Center(child: Text('$i'))
              ],
              diameterRatio: 1,
              scrollController: FixedExtentScrollController(
                initialItem: iAmHere,
              ),
            ),
          ),
          FlatButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.grey[200],
            child: Text(
              'OK',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17.0,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

Dialog bookTrackerDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: BookTracker(),
  );
}
