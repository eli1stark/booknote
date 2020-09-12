// Handling output from Google API

/// Process image
String processImage(var volume) {
  bool imageDoesNotExist = false;

  try {
    volume['imageLinks']['thumbnail'] ?? print('TRY');
  } catch (e) {
    imageDoesNotExist = true;
  }

  if (imageDoesNotExist) {
    return null;
  } else {
    return volume['imageLinks']['thumbnail'];
  }
}

/// Process number of pages
String processPages(int pages) {
  if (pages == null) {
    return 'unknown';
  } else {
    return pages.toString();
  }
}

/// Process authors and publishers
String processAuthors(String publisher, List authors) {
  String processedAuthors = '';

  if (authors == null) {
    if (publisher == null) {
      return 'unknown';
    } else {
      return publisher;
    }
  } else {
    for (String i in authors) {
      if (i == authors.last) {
        processedAuthors += i;
      } else {
        processedAuthors += i + ', ';
      }
    }
    return processedAuthors;
  }
}

/// Convert format of the date from 2010-10-10 to 2010
String dataConverter(String date) {
  String newDate = '';
  bool stop = false;

  if (date != null) {
    date.runes.forEach((int rune) {
      var character = String.fromCharCode(rune);
      if (character == '-') {
        stop = true;
      }
      if (stop == false) {
        newDate += character;
      }
    });
    return newDate;
  } else {
    return 'unknown';
  }
}

/// Go through different qualities of the images
/// and return the best image
String processSelflinkImages(Map imageLinks) {
  if (imageLinks['large'] != null) {
    // width of ~800 pixels
    return imageLinks['large'];
  } else if (imageLinks['medium'] != null) {
    // width of ~575 pixels
    return imageLinks['medium'];
  } else if (imageLinks['small'] != null) {
    // width of ~300 pixels
    return imageLinks['small'];
  } else if (imageLinks['thumbnail'] != null) {
    // width of ~128 pixels
    return imageLinks['thumbnail'];
  } else {
    // width of ~128 pixels
    return imageLinks['smallThumbnail'];
  }
}
