/// Validates email using Regular Expression
bool emailValidator(String value) {
  return RegExp(
    r"^[\w\.+\-%]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$",
  ).hasMatch(value);
}

/// Validates password based on the number of chars
bool passwordValidator(String value) {
  return value.length < 6;
}
