import 'package:flutter/material.dart';

class Credentials {
  Credentials({
    this.email,
    this.password,
    this.formKey,
  });

  final String email;
  final String password;
  final GlobalKey<FormState> formKey;
}
