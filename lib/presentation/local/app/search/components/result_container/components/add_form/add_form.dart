import 'package:auto_size_text/auto_size_text.dart';
import 'package:booknote/domain/search/result_from_api.dart';
import 'package:booknote/infrastructure/api/methods_api.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import 'package:booknote/presentation/global/components/submit_button.dart';
import 'package:booknote/presentation/local/app/bookshelf/bookshelf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../helpers.dart';

class AddBookForm extends StatefulWidget {
  AddBookForm({
    @required this.categories,
    @required this.uid,
    @required this.resultFromAPI,
  });

  final List categories;
  final String uid;
  final ResultFromAPI resultFromAPI;

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  // default to the first category in the list
  int chosenCategoryIndex = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ResultFromAPI resultFromAPI = widget.resultFromAPI;

    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Loader(),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 90,
            width: 200,
            child: CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (int index) =>
                  setState(() => chosenCategoryIndex = index),
              children: [
                for (Map category in widget.categories)
                  Center(
                    child: AutoSizeText(
                      category['emoji'] + category['title'],
                      maxLines: 1,
                    ),
                  )
              ],
              diameterRatio: 1,
              scrollController: FixedExtentScrollController(
                initialItem: chosenCategoryIndex,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          SubmitButton(
            text: 'ADD',
            fontWeight: FontWeight.bold,
            onPressed: () async {
              setState(() => isLoading = true);

              // id of the chosen category
              int categoryID = widget.categories[chosenCategoryIndex]['id'];

              // get a Map of the single book by API call using book ID
              var result = await searchByID(resultFromAPI.bookID);

              // get a link of the image larger than thumbnail if its exist
              String linkToNetworkLargeCover =
                  processImages(result['volumeInfo'], true);

              // add new book to the database
              DatabaseService(uid: widget.uid).addNewBook(
                categoryID: categoryID,
                bookID: resultFromAPI.bookID,
                title: resultFromAPI.title,
                authors: resultFromAPI.authors,
                publisher: resultFromAPI.publisher,
                categoryType: resultFromAPI.categoryType,
                published: resultFromAPI.published,
                pages: resultFromAPI.pages,
                linkToNetworkLargeCover: linkToNetworkLargeCover,
                linkToNetworkThumbnailCover:
                    resultFromAPI.linkToNetworkThumbnailCover,
                currentImage: {
                  'linkPath': linkToNetworkLargeCover ??
                      resultFromAPI.linkToNetworkThumbnailCover,
                  'network': true,
                },
                pagesRead: 0,
                // these values will be added during usage of the App
                pathToLocalCustomCover: null,
                bookNote: null,
              );

              // go to the Bookshelf page
              Navigator.pushNamed(context, Bookshelf.routeName);
            },
          ),
        ],
      );
    }
  }
}
