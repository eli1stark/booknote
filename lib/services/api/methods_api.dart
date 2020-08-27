import 'package:booknote/services/api/networking.dart';
import 'api_key.dart';

const bookAPI = 'https://www.googleapis.com/books/v1/volumes';

Future<dynamic> getBooksFromGoogleApi(String input) async {
  var url =
      '$bookAPI?q=intitle:$input&inauthor:$input&maxResults=40&langRestrict=en&printType=books&key=$apiKey';
  NetworkHelper networkHelper = NetworkHelper(url);

  var books = await networkHelper.getData();

  return books;
}

Future<dynamic> searchByID(String input) async {
  var url = '$bookAPI/$input?key=$apiKey';
  NetworkHelper networkHelper = NetworkHelper(url);

  var bookData = await networkHelper.getData();

  return bookData;
}
