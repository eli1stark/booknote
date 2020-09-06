import 'package:flutter/material.dart';

class CoverUploadButton extends StatelessWidget {
  const CoverUploadButton(this.onTap);

  final Future Function() onTap;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          print('Tap');
          onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.0147,
            horizontal: size.width * 0.049,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: size.width * 0.0073,
            ),
            borderRadius: BorderRadius.circular(15.0),
            // color: Colors.grey[100],
          ),
          child: Text(
            'Upload Image',
            style: TextStyle(
              fontSize: size.width * 0.061,
            ),
          ),
        ),
      ),
    );
  }
}
