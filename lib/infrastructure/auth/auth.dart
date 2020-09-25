import 'package:booknote/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../database/database.dart';
import 'error_handler.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// create AppUser object based on FirebaseUser
  AppUser userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return AppUser(uid: user.uid);
    } else {
      return null;
    }
  }

  /// [STREAM] update user stream if user signed in/up/out
  Stream<AppUser> get user {
    return _auth.onAuthStateChanged.map(userFromFirebaseUser);
  }

  /// [sign up] with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;

      // create a new document for the user
      await DatabaseService(uid: user.uid).setUserData();

      return userFromFirebaseUser(user);
    } on PlatformException catch (error) {
      return signUpErrorHandler(error);
    } catch (error) {
      return 'An undefined Error happened';
    }
  }

  /// [sign in] with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return userFromFirebaseUser(user);
    } on PlatformException catch (error) {
      return signInErrorHandler(error);
    } catch (error) {
      return 'An undefined Error happened';
    }
  }

  /// [sign out]
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on PlatformException catch (error) {
      return error.message;
    } catch (error) {
      return 'An undefined Error happened';
    }
  }

  /// [reset password]
  Future resetUserPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on PlatformException catch (error) {
      return resetPasswordErrorHandler(error);
    } catch (error) {
      return 'An undefined Error happened';
    }
  }
}
