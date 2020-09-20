import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:booknote/domain/categories/categories.dart';

class DatabaseService {
  DatabaseService({this.uid});

  // user ID
  final String uid;

  // users collection reference
  final CollectionReference users = Firestore.instance.collection('users');

  /// [SIGNUP] Setting data for the new user
  Future setUserData() async {
    await users.document(uid).setData({
      'categories': [
        {
          'emoji': '📚',
          'indexKey': 0,
          'title': 'Books',
          'id': 0,
        },
      ],
      'categoryIdCounter': 0,
    });
  }

  /// [CATEGORIES] categories from snapshot
  CategoriesData _categoriesFromSnapshot(DocumentSnapshot snapshot) {
    return CategoriesData(
      categories: snapshot.data['categories'],
      idCounter: snapshot.data['categoryIdCounter'],
    );
  }

  /// [CATEGORIES] get categories
  Stream<CategoriesData> get categories {
    return users.document(uid).snapshots().map(_categoriesFromSnapshot);
  }

  /// [CATEGORIES] update categories (onReorder)
  void updateCategories(List newCategories) {
    users.document(uid).updateData({
      'categories': newCategories,
    });
  }

  /// [CATEGORIES] add new category
  void addCategory(List newCategories, int newCounter) {
    users.document(uid).updateData({
      'categories': newCategories,
      'categoryIdCounter': newCounter,
    });
  }

  /// [BOOKSHELF] get all books from collection
  Stream<QuerySnapshot> get books {
    return users.document(uid).collection('books').snapshots();
  }

  /// [SEARCH] add new book \
  /// currentImage = {'linkPath': 'Path or Link', 'network': true or false} \
  /// by default to NetworkLargeCover if it exists, else to NetworkThumbnailCover \
  /// If user gave storage privilege, image will be cached and local path will be used
  void addNewBook({
    @required int categoryID,
    @required String bookID,
    @required String title,
    @required String authors,
    @required String publisher,
    @required String categoryType,
    @required String published,
    @required int pages,
    @required String linkToNetworkLargeCover,
    @required String linkToNetworkThumbnailCover,
    @required String pathToLocalLargeCover,
    @required String pathToLocalThumbnailCover,
    @required String pathToLocalCustomCover,
    @required Map currentImage,
    @required int pagesRead,
    @required String pathToNote,
  }) {
    users.document(uid).collection('books').add({
      'categoryID': categoryID,
      'bookID': bookID,
      'title': title,
      'authors': authors,
      'publisher': publisher,
      'categoryType': categoryType,
      'published': published,
      'pages': pages,
      'linkToNetworkLargeCover': linkToNetworkLargeCover,
      'linkToNetworkThumbnailCover': linkToNetworkThumbnailCover,
      'pathToLocalLargeCover': pathToLocalLargeCover,
      'pathToLocalThumbnailCover': pathToLocalThumbnailCover,
      'pathToLocalCustomCover': pathToLocalCustomCover,
      'currentImage': currentImage,
      'pagesRead': pagesRead,
      'pathToNote': pathToNote,
    });
  }

  /// [BOOK] will update 'pages' and 'pagesRead' values
  void updateBookPages(
    String documentID,
    int pages,
    int pagesRead,
  ) {
    users.document(uid).collection('books').document(documentID).updateData({
      'pages': pages,
      'pagesRead': pagesRead,
    });
  }

  /// [BOOK] will update category of the Book
  void updateBookCategoryID(
    String documentID,
    int categoryID,
  ) {
    users.document(uid).collection('books').document(documentID).updateData({
      'categoryID': categoryID,
    });
  }
}
