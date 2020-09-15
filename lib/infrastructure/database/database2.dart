import 'package:booknote/domain/categories/categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService1 {
  // collection reference
  // final CollectionReference users = Firestore.instance.collection('users');

  // CATEGORIES
  // document reference (categories)
  final DocumentReference _categories = Firestore.instance
      .document('/users/5wONbu7gzq4GPbsvxMj8/categories/ylau1HB2GwZddaCMWO6n');

  /// categories from snapshot
  CategoriesData _categoriesFromSnapshot(DocumentSnapshot snapshot) {
    return CategoriesData(
      categories: snapshot.data['categories'],
      idCounter: snapshot.data['idCounter'],
    );
  }

  /// get categories (Stream)
  Stream<CategoriesData> get userCategories {
    return _categories.snapshots().map(_categoriesFromSnapshot);
  }

  /// update categories
  updateCategories(List newCategories) {
    _categories.updateData({
      'categories': newCategories,
    });
    print('success');
  }

  /// add new category (with Counter)
  addCategory(List newCategories, int newCounter) {
    _categories.updateData({
      'categories': newCategories,
      'idCounter': newCounter,
    });
    print('counter success');
  }

  // BOOKSHELF
  // subcollection reference (categories)
  final CollectionReference _books =
      Firestore.instance.collection('/users/5wONbu7gzq4GPbsvxMj8/books');

  // get all books from collection
  Stream<QuerySnapshot> get userBooks {
    return _books.snapshots();
  }

  // SEARCH
  // add new book
  addNewBook(
    int categoryID,
    String networkImage,
    String title,
    String authors,
    String pages,
    String published,
    String bookID,
  ) {
    _books.add({
      'categoryID': categoryID,
      'networkImage': networkImage,
      'title': title,
      'authors': authors,
      'pages': pages,
      'published': published,
      'googleBookID': bookID,
    });
  }
}
