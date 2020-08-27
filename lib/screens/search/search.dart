import 'package:flutter/material.dart';

// components
import 'components/app_bar.dart';
import 'components/divider.dart';
import 'components/container/container.dart';
import 'package:booknote/components/loader.dart';
import 'package:booknote/components/alert_info.dart';

// provider + models
import 'package:provider/provider.dart';
import 'package:booknote/models/categories.dart';

// services
import 'package:booknote/services/api/methods_api.dart';

// Handling output from Google API (services)
import 'components/utils.dart';

class Search extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchState createState() => _SearchState();
}

var resultFromAPI;

bool isLoading = false;

// categories from databse
var categories;

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      // on Android back button
      onWillPop: () async {
        // clear search result
        setState(() => resultFromAPI = null);
        // go back to Bookshelf page
        Navigator.pop(context);
        // I need to return something
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: SearchAppBar(
            // on Material back button
            onPressed: () {
              // clear search result
              setState(() => resultFromAPI = null);
              // go back to Bookshelf page
              Navigator.pop(context);
            },
            // on Search
            onFieldSubmitted: (input) async {
              if (input != '') {
                // start Loading
                setState(() => isLoading = true);

                // get Result from the Google API
                resultFromAPI = await getBooksFromGoogleApi(input);

                // get categories from the Stream(from the Database)
                // listen: false, because I don't need to listen for the Stream
                // becasue I need this value only once and it won't change on this page
                categories = Provider.of<CategoriesData>(context, listen: false)
                    .categories;

                // end Loading
                setState(() => isLoading = false);
              }
            },
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: SafeArea(
          // implement loading during search
          child: isLoading
              ? Loader()
              : Container(
                  // check whether the search was called
                  child: resultFromAPI != null
                      ? Container(
                          // check whether the search found something
                          child: resultFromAPI['totalItems'] != 0
                              ? ListView(
                                  children: <Widget>[
                                    for (var result in resultFromAPI['items'])
                                      // If image is not available then skip it
                                      processImage(result['volumeInfo']) == null
                                          ? Container()
                                          : Column(
                                              children: [
                                                SearchResultContainer(
                                                  size: size,
                                                  title: result['volumeInfo']
                                                      ['title'],
                                                  authors: processAuthors(
                                                    result['volumeInfo']
                                                        ['publisher'],
                                                    result['volumeInfo']
                                                        ['authors'],
                                                  ),
                                                  pages: processPages(
                                                    result['volumeInfo']
                                                        ['pageCount'],
                                                  ),
                                                  published: dataConverter(
                                                    result['volumeInfo']
                                                        ['publishedDate'],
                                                  ),
                                                  image: processImage(
                                                    result['volumeInfo'],
                                                  ),
                                                  bookID: result['id'],
                                                  categories: categories,
                                                ),
                                                SearchResultDivider(),
                                              ],
                                            ),
                                  ],
                                )
                              : AlertInfo(
                                  // nothing found
                                  image: 'images/not_found.png',
                                  text: 'Not Found!',
                                  size: size,
                                ),
                        )
                      : Container(),
                ),
        ),
      ),
    );
  }
}

// TODO remove last divider in the search listview
// FIXME some problem when I type some of the words I getting white screen
// but should get result or alert info that image is not found
// screenshots on the phone
