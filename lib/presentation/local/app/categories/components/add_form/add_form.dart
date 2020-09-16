import 'package:booknote/domain/auth/user.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/theme/constants.dart';
import 'package:provider/provider.dart';
import '../../../emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';

class AddForm extends StatefulWidget {
  AddForm(
    this.categories,
    this.idCounter,
  );

  final List categories;
  final int idCounter;

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  // Key for Form Validation
  final _formKey = GlobalKey<FormState>();

  // Skeleton of the Map to add to the Firestore
  Map _item = {
    'emoji': '',
    'indexKey': 0,
    'title': '',
    'id': 0,
  };

  // The main magic is in "goToEmojiPickerPage" where it is an async function,
  // awaiting for the "EmojiPicker" to come back with some 'data',
  // which I assign it to "emoji" here. Then I call
  // "updateEmoji" update the state, which will also trigger
  // the buildmethod to run again, updating my Form.
  void updateEmoji(Map item) {
    setState(() => _item = item);
  }

  void goToEmojiPickerPage() async {
    final item = await Navigator.pushNamed(
      context,
      EmojiPicker.routeName,
      arguments: EmojiPickerArgument(
        item: _item,
        status: 'add',
      ),
    );
    updateEmoji(item);
  }
  // end of magic

  @override
  Widget build(BuildContext context) {
    // get user id
    String uid = Provider.of<AppUser>(context).uid;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Add new category',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) => value.isEmpty ? 'Please enter text' : null,
            onChanged: (value) => _item['title'] = value,
          ),
          SizedBox(height: 20.0),
          InkWell(
            child: _item['emoji'] == ''
                ? Icon(
                    Icons.tag_faces,
                    size: 50.0,
                    color: Colors.black,
                  )
                : Text(
                    _item['emoji'],
                    style: TextStyle(
                      fontSize: 50.0,
                    ),
                  ),
            customBorder: CircleBorder(),
            onTap: () {
              goToEmojiPickerPage();
            },
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.grey[600],
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                // update index of the item
                _item['indexKey'] = widget.categories.length;

                // update id of the item
                _item['id'] = widget.idCounter + 1;

                // Add item to the list of categories
                widget.categories.add(_item);

                // update Firestore
                DatabaseService(uid: uid).addCategory(
                  widget.categories,
                  _item['id'],
                );
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
