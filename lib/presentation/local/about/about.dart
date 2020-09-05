import 'package:flutter/material.dart';

AboutDialog appAboutDialog() {
  return AboutDialog(
    applicationName: 'Booknote',
    applicationVersion: '1.0.1',
    applicationIcon: Container(
      width: 50.0,
      height: 50.0,
      child: Image.asset(
        'images/icon.png',
      ),
    ),
    applicationLegalese: 'Made with love by Hoolic Inc.',
    children: [
      SizedBox(height: 20.0),
      Text('Make notes and track your books!'),
    ],
  );
}
