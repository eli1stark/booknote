import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:booknote/screens/book/components/app_bar.dart';
import 'package:booknote/screens/book/components/book_frame.dart';

class BookArgument {
  BookArgument(this.path);

  final String path;
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
        child: BookAppBar(),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Stack(
        children: <Widget>[
          BookFrame(size: size, imgSrc: arg.path),
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
                      color: Colors.grey[500].withOpacity(0.3), width: 1.0),
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
