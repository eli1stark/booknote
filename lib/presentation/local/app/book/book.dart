import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'components/appbar/app_bar.dart';
import 'components/book_box/book_box.dart';

class BookArgument {
  BookArgument(this.book);

  final DocumentSnapshot book;
}

class Book extends StatefulWidget {
  static const routeName = '/book';

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    // Get Argument(path) from Bookshelf page
    BookArgument arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: BookAppBar(arg.book),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Stack(
        children: <Widget>[
          BookBox(arg.book),
          DraggableScrollableSheet(
            initialChildSize: 0.56,
            minChildSize: 0.56,
            builder: (BuildContext context, scrollController) {
              return Container(
                padding: EdgeInsets.only(
                  left: 0.0,
                  right: 0.0,
                  bottom: 10.0,
                  top: 6.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  border: Border.all(
                    color: Colors.grey[500].withOpacity(0.3),
                    width: 1.0,
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                    // Little bar
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.black.withOpacity(0.2),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.44,
                      ),
                      height: size.height * 0.008,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
