import 'package:booknote/infrastructure/api/networking.dart';
import 'api_key.dart';

const bookAPI = 'https://www.googleapis.com/books/v1/volumes';

/// Return Map which has property "items" which is a List of Maps(books)
Future<Map> getBooksFromGoogleApi(String input) async {
  var url =
      '$bookAPI?q=intitle:$input&inauthor:$input&maxResults=40&langRestrict=en&printType=books&key=$apiKey';
  NetworkHelper networkHelper = NetworkHelper(url);

  var books = await networkHelper.getData();

  return books;
}

/// Return single Map(book)
Future<Map> searchByID(String input) async {
  var url = '$bookAPI/$input?key=$apiKey';
  NetworkHelper networkHelper = NetworkHelper(url);

  var bookData = await networkHelper.getData();

  return bookData;
}
