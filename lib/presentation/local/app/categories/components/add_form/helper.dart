String addFieldValidator(String value, List categories) {
  bool titleExists = false;

  for (Map category in categories) {
    if (value == category['title']) {
      titleExists = true;
    }
  }

  if (value.isEmpty) {
    return 'Please enter name';
  } else if (titleExists) {
    return 'Category already exists';
  } else if (value.length > 20) {
    return 'Name needs to be less than 20 characters';
  } else {
    return null;
  }
}
