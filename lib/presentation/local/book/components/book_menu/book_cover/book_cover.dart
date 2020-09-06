import 'dart:io';
import 'package:booknote/presentation/global/components/big_title.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'components/appbar.dart';
import 'components/upload_cover/upload_cover.dart';

class BookCover extends StatefulWidget {
  static const routeName = '/book_cover';

  @override
  _BookCoverState createState() => _BookCoverState();
}

class _BookCoverState extends State<BookCover> {
  bool selected = false;

  // TODO create local database to store uploaded images
  // IF user will change device than all uploaded images will be lost
  // I won't store them in Google Cloud (too much for thsi app)
  // Just SQL or NoSQL database, all info other than uploaded images
  // will be stored in the Firestore
  // image picker
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    try {
      print('Start');
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(pickedFile.path);
        print(_image);
      });
      print('End');
    } catch (e) {
      print(e);
    }
  }
  // end

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
                    // TODO
                    _image != null ? Image.file(_image) : Container(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: UploadBookCover(getImage),
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
