import 'package:booknote/infrastructure/database/database.dart';
import 'package:flutter/material.dart';
import '../category_button.dart';
import '../styles.dart';
import 'helpers.dart';

class EditForm extends StatefulWidget {
  EditForm({
    this.item,
    this.categories,
    this.uid,
  });
  final Map item;
  final List categories;
  final String uid;

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // for initial value and validator
    String itemTitle = widget.item['title'];
    // for updating category in the database
    String newItemTitle = widget.item['title'];

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          TextFormField(
            initialValue: itemTitle,
            textCapitalization: TextCapitalization.sentences,
            decoration: categoryFieldDecoration,
            validator: (value) =>
                editFieldValidator(value, itemTitle, widget.categories),
            onChanged: (value) => newItemTitle = value,
          ),
          SizedBox(height: 20.0),
          CategoryButton(
            text: 'UPDATE',
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                // update Categories(List of Maps)
                widget.categories[widget.item['indexKey']]['title'] =
                    newItemTitle;

                // update Firestore
                DatabaseService(uid: widget.uid)
                    .updateCategories(widget.categories);

                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
