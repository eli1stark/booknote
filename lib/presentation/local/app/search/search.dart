import 'package:booknote/infrastructure/api/methods_api.dart';
import 'package:booknote/presentation/global/components/alert_info.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import 'package:flutter/material.dart';
import 'components/app_bar.dart';
import 'components/divider.dart';
import 'components/container/container.dart';
import 'components/helpers.dart';

class SearchArgument {
  SearchArgument(this.categories);
  List categories;
}

class Search extends StatefulWidget {
  static const routeName = '/search';
  
  @override
  _SearchState createState() => _SearchState();
}

var resultFromAPI;

bool isLoading = false;

// categories from database
var categories;

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    // Get argument('categories') from Bookshelf page
    SearchArgument arg = ModalRoute.of(context).settings.arguments;

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
                                                  categories: arg.categories,
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
