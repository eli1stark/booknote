// Handling output from Google API

import '../../../../../domain/search/result_from_api.dart';
import 'package:flutter/material.dart';
import 'result_container/result_container.dart';
import 'divider.dart';

/// Process resultFromAPI
List<Widget> processResultFromAPI(
  Map resultFromAPI,
  List categories,
  String uid,
) {
  List<Widget> output = [];

  for (Map result in resultFromAPI['items']) {
    Map volumeInfo = result['volumeInfo'];

    // if there is no image in the book then it doesn't make any sense
    // to show this book, since whole app philosophy is based on images
    if (checkImages(volumeInfo) != false) {
      output.add(
        Column(
          children: [
            SearchResultContainer(
              categories: categories,
              uid: uid,
              resultFromAPI: ResultFromAPI(
                bookID: result['id'],
                title: processTitle(volumeInfo),
                authors: processAuthors(volumeInfo),
                publisher: processPublisher(volumeInfo),
                categoryType: processCategoryType(volumeInfo),
                published: processPublishedDate(volumeInfo),
                pages: processPages(volumeInfo),
                linkToNetworkThumbnailCover: processImages(volumeInfo, false),
              ),
            ),
            SearchResultDivider(),
          ],
        ),
      );
    }
  }

  return output;
}

String unknown = 'Unknown';

/// Process [Title]: return title
String processTitle(Map volumeInfo) {
  if (volumeInfo['title'] != null) {
    return volumeInfo['title'];
  } else {
    return unknown;
  }
}

/// Process [Authors] \
/// Takes List of Authors and convert it to the single String
String processAuthors(Map volumeInfo) {
  List authors = volumeInfo['authors'];

  return listToString(authors);
}

/// Process [Publisher]: return publisher
String processPublisher(Map volumeInfo) {
  if (volumeInfo['publisher'] != null) {
    return volumeInfo['publisher'];
  } else {
    return unknown;
  }
}

/// Process [CategoryType] \
/// Takes List of Category Types and convert it to the single String
String processCategoryType(Map volumeInfo) {
  List categoryTypes = volumeInfo['categories'];

  return listToString(categoryTypes);
}

/// Process [Published Date]: \
/// Convert Format of [2010-10-10] to [2010]
String processPublishedDate(Map volumeInfo) {
  String date = volumeInfo['publishedDate'];
  String output = '';

  if (date != null) {
    for (String i in date.split('')) {
      if (i == '-') {
        break;
      } else {
        output = output + i;
      }
    }
    return output;
  } else {
    return unknown;
  }
}

/// Process [Pages] \
/// Return pages of the book. If the value is null return zero.
int processPages(Map volumeInfo) {
  if (volumeInfo['pageCount'] != null) {
    return volumeInfo['pageCount'];
  } else {
    return 0;
  }
}

/// Process [Images] \
/// Checking existing of images in the result from API and API call using ID. \
/// I'm getting Large images from single API call using ID \
/// when adding single book to Bookshelf. \
/// I can't get them from result of 40 books (resultFromAPI). \
/// IF Large image exists and 'large' is true: \
/// return Link of the Large image. \
/// IF Thumbnail exists and 'large' is false: \
/// return Link of the Thumbnail.
String processImages(Map volumeInfo, bool large) {
  Map images = volumeInfo['imageLinks'];

  String output;

  if (large) {
    // width of ~800 pixels
    if (images['large'] != null) {
      output = images['large'];
    }
    // width of ~575 pixels
    else if (images['medium'] != null) {
      output = images['medium'];
    }
    // width of ~300 pixels
    else if (images['small'] != null) {
      output = images['small'];
    }
  } else {
    // width of ~128 pixels
    if (images['thumbnail'] != null) {
      output = images['thumbnail'];
    }
    // width of ~128 pixels
    else if (images['smallThumbnail'] != null) {
      output = images['smallThumbnail'];
    }
  }

  return output;
}

/// check [Images] \
/// Check whether there are images at all
bool checkImages(Map volumeInfo) {
  if (volumeInfo['imageLinks'] == null) {
    return false;
  } else {
    return true;
  }
}

/// [HELPER] Takes List of Strings and convert it to the single String
String listToString(List list) {
  String output = '';

  if (list != null) {
    for (String i in list) {
      if (i == list.last) {
        output = output + i;
      } else {
        output = output + i + ', ';
      }
    }
    return output;
  } else {
    return unknown;
  }
}
