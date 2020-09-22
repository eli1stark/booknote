import 'package:booknote/application/book/cover_state_cubit.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:image_picker/image_picker.dart';

/// Takes coverStateCubit as an argument,
/// upload image and update state accordingly
Future getImage(
  CoverStateCubit coverCubit,
  DatabaseService database,
  String documentID,
) async {
  try {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    // update Cubit and automatically select uploaded image
    coverCubit.uploadCustomCover(pickedFile.path);

    // update Database and automatically select uploaded image
    database.updateCustomImage(
      coverCubit.state.customImage,
      documentID,
    );
  } catch (e) {
    print(e);
  }
}

/// Takes cover and selected cover state and
/// return opacity value depending on the selectedState
double processOpacity(
  String cover,
  String selectedImage,
) {
  if (cover == selectedImage) {
    return 1;
  } else {
    return 0.2;
  }
}
