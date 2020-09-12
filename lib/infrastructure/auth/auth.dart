import 'package:booknote/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  /// change user stream if user signed in/up/out
  Stream<AppUser> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  /// anonymous test
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  /// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
