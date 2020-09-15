import 'package:booknote/infrastructure/api/methods_api.dart';
import 'package:booknote/infrastructure/database/database2.dart';
import '../../../../bookshelf/bookshelf1.dart';
import 'package:flutter/material.dart';
import '../../utils.dart';

class AddBookForm extends StatefulWidget {
  AddBookForm({
    @required this.size,
    @required this.title,
    @required this.authors,
    @required this.pages,
    @required this.published,
    @required this.bookID,
    @required this.categories,
  });

  final Size size;
  final String title;
  final String authors;
  final String pages;
  final String published;
  final String bookID;
  final List categories;

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  // value of the dropdown button
  String dropdownValue;
  // for validation purposes (default to true)
  bool categoryWasChoosen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          hint: Text(
            'Select category',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          icon: Icon(
            Icons.arrow_downward,
          ),
          iconSize: 26,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              categoryWasChoosen = true;
            });
          },
          items: [
            for (Map category in widget.categories)
              DropdownMenuItem<String>(
                value: category['emoji'] + category['title'],
                child: Text(
                  category['emoji'] + category['title'],
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
          ],
        ),
        categoryWasChoosen
            ? Container()
            : Text(
                'Please choose category',
                style: TextStyle(
                  color: Colors.red[700],
                ),
              ),
        SizedBox(height: 10.0),
        RaisedButton(
          child: Text('Add'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () async {
            // validate dropdown button
            if (dropdownValue == null) {
              setState(() => categoryWasChoosen = false);
            } else {
              int categoryID;

              // find choosen category through iteration
              for (Map category in widget.categories) {
                if (category['emoji'] + category['title'] == dropdownValue) {
                  categoryID = category['id'];
                }
              }

              // get selflink of the book through API call to load better quality images
              var result = await searchByID(widget.bookID);

              // iterate through all available formats and return the best
              String newImage =
                  processSelflinkImages(result['volumeInfo']['imageLinks']);

              // add new book to the database
              DatabaseService1().addNewBook(
                categoryID,
                newImage,
                widget.title,
                widget.authors,
                widget.pages,
                widget.published,
                widget.bookID,
              );

              // clear search result
              // setState(() => resultFromAPI = null);

              // go to the Bookshelf page
              Navigator.pushNamed(context, Bookshelf1.routeName);
            }
          },
        ),
      ],
    );
  }
}

// TODO prompt user that book is already added if it is. and pop back to search
// id validatation ->
// TODO clear search result when added book
// I probably need notify listeners, to notify search page about value from this page
