import 'package:booknote/application/search/search_state_cubit.dart';
import 'package:booknote/domain/search/search_state.dart';
import 'package:booknote/infrastructure/api/methods_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/app_bar.dart';
import 'components/result.dart';

class SearchArgument {
  SearchArgument(
    this.categories,
    this.uid,
  );

  List categories;
  String uid;
}

class Search extends StatelessWidget {
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    // Get argument('categories') from Bookshelf page
    SearchArgument arg = ModalRoute.of(context).settings.arguments;

    return BlocProvider<SearchStateCubit>(
      create: (BuildContext context) => SearchStateCubit(),
      child: BlocBuilder<SearchStateCubit, SearchState>(
        builder: (context, searchState) {
          // Create 'SearchStateCubit' instance
          SearchStateCubit searchCubit =
              BlocProvider.of<SearchStateCubit>(context);

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              child: SearchAppBar(
                onPressed: () {
                  Navigator.pop(context);
                },
                // on Search
                onFieldSubmitted: (input) async {
                  if (input != '') {
                    searchCubit.startLoading(searchState);

                    // get Result from the Google API and end Loading
                    searchCubit.updateResult(
                      await getBooksFromGoogleApi(input),
                      searchState,
                    );
                  }
                },
              ),
              preferredSize: Size.fromHeight(kToolbarHeight),
            ),
            body: SafeArea(
              child: SearchResult(arg.categories, arg.uid),
            ),
          );
        },
      ),
    );
  }
}

// TODO remove last divider in the search listview
// FIXME some problem when I type some of the words I getting white screen
// but should get result or alert info that image is not found
// screenshots on the phone
