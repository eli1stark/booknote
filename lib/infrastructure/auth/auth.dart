import 'package:booknote/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../database/database.dart';
import 'error_handler.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// create AppUser object based on FirebaseUser
  AppUser _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return AppUser(uid: user.uid);
    } else {
      return null;
    }
  }

  /// update user stream if user signed in/up/out
  Stream<AppUser> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  /// register with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;

      // create a new document for the user
      await DatabaseService(uid: user.uid).setUserData();

      return _userFromFirebaseUser(user);
    } on PlatformException catch (error) {
      return signUpErrorHandler(error);
    } catch (error) {
      return 'An undefined Error happened.';
    }
  }

  /// sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } on PlatformException catch (error) {
      return signInErrorHandler(error);
    } catch (error) {
      return 'An undefined Error happened.';
    }
  }

  /// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      return null;
    }
  }
}
