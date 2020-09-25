import 'package:booknote/application/book/tracker_state_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tracker_dialog.dart';

void showBookTrackerDialog(
  BuildContext context,
  DocumentSnapshot book,
  String uid,
) {
  // InheritedWidgets, and therefore Providers, are scoped to the
  // widget tree. They cannot be accessed outside of that tree.
  // The thing is, using showDialog and similar functions,
  // the dialog is located in a different widget tree –
  // which may not have access to the desired provider.
  // It is therefore necessary to add the desired providers
  // in that new widget tree using Provider.value()
  showDialog(
    context: context,
    builder: (_) => BlocProvider.value(
      value: BlocProvider.of<BookTrackerCubit>(context),
      child: bookTrackerDialog(context, book, uid),
    ),
  );
}
