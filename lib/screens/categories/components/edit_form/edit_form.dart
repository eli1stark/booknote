import 'package:booknote/services/database/database.dart';
import 'package:booknote/theme/constants.dart';
import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  EditForm({
    this.item,
    this.categories,
  });
  final Map item;
  final List categories;

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    // Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Edit',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            initialValue: widget.item['title'],
            textCapitalization: TextCapitalization.sentences,
            decoration: textInputDecoration,
            validator: (value) =>
                value.isEmpty ? 'Please enter text' : null,
            onChanged: (value) =>
                setState(() => widget.item['title'] = value),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            color: Colors.grey[600],
            child: Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                // update Categories(List of Maps)
                widget.categories[widget.item['indexKey']] = widget.item;

                // update Firestore
                DatabaseService().updateCategories(widget.categories);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
