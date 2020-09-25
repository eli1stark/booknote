import 'package:flutter/services.dart';

/// Takes PlatformException and returns String
/// based on the error code. [EMAIL]
String signInErrorHandler(PlatformException error) {
  switch (error.code) {
    // this case won't appear since I validate email on my side
    case 'ERROR_INVALID_EMAIL':
      return 'Your email address is invalid. Try again!';
    case 'ERROR_WRONG_PASSWORD':
      return 'Your password is incorrect. Try again!';
    case 'ERROR_USER_NOT_FOUND':
      return 'User with this email doesn\'t exist';
    case 'ERROR_USER_DISABLED':
      return 'User with this email has been disabled';
    case 'ERROR_TOO_MANY_REQUESTS':
      return 'Too many requests. Try again later.';
    // this case won't appear since E&P enabled
    case "ERROR_OPERATION_NOT_ALLOWED":
      return 'Signing in with Email and Password is not enabled';
    default:
      return 'An undefined Error happened';
  }
}

/// Takes PlatformException and returns String
/// based on the error code. [EMAIL]
String signUpErrorHandler(PlatformException error) {
  switch (error.code) {
    // this case won't appear since I validate email on my side
    case 'ERROR_INVALID_EMAIL':
      return 'This email address is invalid. Try again!';
    // this case won't appear since I validate password on my side
    case 'ERROR_WEAK_PASSWORD':
      return 'Your password is not strong enough. Try again!';
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return 'This email already exists. Try again!';
    default:
      return 'An undefined Error happened.';
  }
}

/// Takes PlatformException and returns String
/// based on the error code. [CREDENTIALS]
String signInCredentialErrorHandler(PlatformException error) {
  switch (error.code) {
    case 'ERROR_INVALID_CREDENTIAL':
      return 'The credential data is malformed or has expired';
    case 'ERROR_USER_DISABLED':
      return 'The user has been disabled';
    case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
      return 'There already exists an account with the email address asserted by Google';
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'Google accounts are not enabled. Contact support!';
    case 'ERROR_INVALID_ACTION_CODE':
      return 'The action code in the link is malformed, expired, or has already been used';
    default:
      return 'An undefined Error happened.';
  }
}
