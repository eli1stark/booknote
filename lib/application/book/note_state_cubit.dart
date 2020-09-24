import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zefyr/zefyr.dart';

class BookNoteCubit extends Cubit<ZefyrController> {
  BookNoteCubit(ZefyrController controller) : super(controller);

  void update(ZefyrController controller) => emit(controller);
}
