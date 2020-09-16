import 'package:flutter/material.dart';
import 'add_button.dart';
import 'pages_date.dart';
import 'title_author.dart';
import 'add_form/pop_out.dart';

class SearchResultContainer extends StatelessWidget {
  const SearchResultContainer({
    @required this.size,
    @required this.title,
    @required this.authors,
    @required this.pages,
    @required this.published,
    @required this.image,
    @required this.bookID,
    @required this.categories,
  });

  final Size size;
  final String title;
  final String authors;
  final String pages;
  final String published;
  final String image;
  final String bookID;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: size.height * 0.2314564,
            width: size.width * 0.3201058,
            child: 
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              // semanticContainer and clipBehavior allow Card to overflow image
              // and show its round corners
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.0),
                      TitleAuthorText(
                        text: title,
                        fontSize: 17.0,
                      ),
                      SizedBox(height: 5.0),
                      TitleAuthorText(
                        text: 'by $authors',
                        fontSize: 15.0,
                      ),
                      SizedBox(height: 5.0),
                      // prevent 'Published' and 'Pages' overflow the button
                      // with Container width
                      PagesDateText(
                        text: 'Pages: $pages',
                        size: size,
                      ),
                      SizedBox(height: 5.0),
                      PagesDateText(
                        text: 'Published: $published',
                        size: size,
                      ),
                    ],
                  ),
                  AddBookButton(
                    onPressed: () => showAddPopOut(
                      context,
                      size,
                      title,
                      authors,
                      pages,
                      published,
                      bookID,
                      categories,
                    ),
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

