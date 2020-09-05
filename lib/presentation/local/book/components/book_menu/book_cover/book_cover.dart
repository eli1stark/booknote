import 'package:booknote/presentation/global/components/big_title.dart';
import 'package:flutter/material.dart';
import 'components/appbar.dart';

class BookCover extends StatefulWidget {
  static const routeName = '/book_cover';

  @override
  _BookCoverState createState() => _BookCoverState();
}

class _BookCoverState extends State<BookCover> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    bool networkImage = true;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: BookCoverAppBar(),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          BigTitle(
            text: 'Choose cover',
            size: 35.0,
          ),
          Expanded(
            flex: 7,
            child: Container(
              // color: Colors.green[50],
              padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Container(
                // color: Colors.orange[50],
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                        print(selected);
                      },
                      child: BookCoverContainer(
                        networkImage: networkImage,
                        selected: selected,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    BookCoverContainer(
                      networkImage: networkImage,
                    ),
                    SizedBox(width: 20.0),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.blueAccent),
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡Hints: ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      '1. The ideal size of your eBook cover is a height/width ratio of 1.6:1.',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      '2. Pink shadow indicates selected cover.',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      '3. You can upload one cover per book.',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          // color: Colors.grey[100],
                        ),
                        child: Text(
                          'Upload Image',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BookCoverContainer extends StatelessWidget {
  const BookCoverContainer({
    Key key,
    @required this.networkImage,
    this.selected,
  }) : super(key: key);

  final bool networkImage;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: selected == true ? Colors.pinkAccent[400] : Colors.grey,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // semanticContainer and clipBehavior allow Card to overflow image
      // and show its round corners
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: networkImage
          ? Image.network(
              'http://books.google.com/books/content?id=r0q9GTKO0qUC&printsec=frontcover&img=1&zoom=4&edge=curl&imgtk=AFLRE71MePF8gHSOCrpxyLj3J7Ja2unF6oKBHfFJxeQbaJo_bGazQooz3ZGY01a--EHKkHsDXWq3EWY2-LLOYOvu7wApXsoE6ouqoePBlDG9HPe9FmXPQz9BUvmVCMidnhY-rygjoxWm&source=gbs_api')
          : Image.asset('imagePath'),
    );
  }
}
