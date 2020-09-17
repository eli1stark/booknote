import 'package:booknote/application/search/search_state_cubit.dart';
import 'package:booknote/domain/search/search_state.dart';
import 'package:booknote/presentation/global/components/alert_info.dart';
import 'package:booknote/presentation/global/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helpers.dart';

class SearchResult extends StatelessWidget {
  SearchResult(
    this.categories,
    this.uid,
  );

  final List categories;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchStateCubit, SearchState>(
      builder: (context, searchState) {
        final resultFromAPI = searchState.resultFromAPI;

        // implement loading during search
        if (searchState.isLoading) {
          return Loader();
        } else {
          // check whether the search was called
          if (resultFromAPI != null) {
            // check whether the search found something
            if (resultFromAPI['totalItems'] != 0) {
              return ListView(
                children: processResultFromAPI(
                  resultFromAPI,
                  categories,
                  uid,
                ),
              );
            } else {
              return AlertInfo(
                image: 'images/not_found.png',
                text: 'Not Found!',
              );
            }
          } else {
            return Container();
          }
        }
      },
    );
  }
}
