import 'package:booknote/domain/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchStateCubit extends Cubit<SearchState> {
  SearchStateCubit()
      : super(
          SearchState(
            resultFromAPI: null,
            isLoading: false,
          ),
        );

  void updateResult(Map result, SearchState state) {
    emit(
      SearchState(
        resultFromAPI: result,
        isLoading: false,
      ),
    );
  }

  void startLoading(SearchState state) {
    emit(
      SearchState(
        resultFromAPI: state.resultFromAPI,
        isLoading: true,
      )
    );
  }
}
