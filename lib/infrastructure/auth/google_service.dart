import 'package:booknote/infrastructure/database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth.dart';
import 'error_handler.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// [sign in]
  Future signInWithGoogle() async {
    try {
      // trigger sign in process
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      // Holds authentication tokens after sign in
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // sign in to Firebase with the given 3rd-party credentials
      AuthResult authResult = await _auth.signInWithCredential(credential);

      // get Firebase user
      FirebaseUser user = authResult.user;

      // User signing in for the first time
      if (authResult.additionalUserInfo.isNewUser) {
        // create a new document for the user
        await DatabaseService(uid: user.uid).setUserData();
      }

      return AuthService().userFromFirebaseUser(user);
    } on PlatformException catch (error) {
      return signInCredentialErrorHandler(error);
    } catch (error) {
      // handling dissmising Google Sign In prompt (NoSuchMethodError)
      if (error.toString().startsWith('NoSuchMethodError')) {
        // don't show snackBar
        return null;
      } else {
        return 'An undefined Error happened.';
      }
    }
  }

  /// [sign out]
  /// For signing out from Google I can just use FirebaseAuth. \
  /// But if user will sign in again he won't \
  /// get any promt to choose google email, so he will \
  /// sign in with the previous email(silently). \
  /// To achive prompt of emails every time user signing in \
  /// I need to use signOut() method from GoogleSignIn.
  Future signOutWithGoogle() async {
    try {
      return await _googleSignIn.signOut();
    } on PlatformException catch (error) {
      return error.message;
    } catch (error) {
      return 'An undefined Error happened.';
    }
  }
}
