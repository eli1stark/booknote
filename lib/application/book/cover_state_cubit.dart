import 'package:booknote/domain/book/cover_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoverStateCubit extends Cubit<CoverState> {
  CoverStateCubit({
    String customImage,
    String selectedImage,
    bool network,
  }) : super(
          CoverState(
            customImage: customImage,
            selectedImage: selectedImage,
            network: network,
          ),
        );

  void selectCover(
    String selectedImage,
    CoverState state,
    bool network,
  ) {
    emit(CoverState(
      customImage: state.customImage,
      selectedImage: selectedImage,
      network: network,
    ));
  }

  /// update path and automatically select uploaded Image
  void uploadCustomCover(String newCover) {
    emit(CoverState(
      customImage: newCover,
      selectedImage: newCover,
      network: false,
    ));
  }
}
