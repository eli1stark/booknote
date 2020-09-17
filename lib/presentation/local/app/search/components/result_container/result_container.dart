import 'package:booknote/domain/search/result_from_api.dart';
import 'package:flutter/material.dart';
import 'components/add_button.dart';
import 'components/add_form/pop_out.dart';
import 'components/common_text.dart';
import 'components/spacers.dart';
import 'components/title_author.dart';

class SearchResultContainer extends StatelessWidget {
  const SearchResultContainer({
    @required this.categories,
    @required this.uid,
    @required this.resultFromAPI,
  });

  final List categories;
  final String uid;
  final ResultFromAPI resultFromAPI;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Container(
      // 1.6 : 1 golden ratio (200/125)
      height: 200.0,
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            // 1.6 : 1 golden ratio (200/125)
            width: 125.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              // semanticContainer and clipBehavior allow Card to overflow image
              // and show its round corners
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                resultFromAPI.linkToNetworkThumbnailCover,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpacerHeight2px(),
                      TitleAuthorText(
                        text: resultFromAPI.title,
                        title: true,
                      ),
                      SpacerHeight5px(),
                      TitleAuthorText(
                        text: 'by ${resultFromAPI.authors}',
                      ),
                      SpacerHeight5px(),
                      CommonText(
                        title: 'Category: ',
                        text: '${resultFromAPI.categoryType}',
                      ),
                      SpacerHeight5px(),
                      CommonText(
                        title: 'Pages: ',
                        text: '${resultFromAPI.pages}',
                        halfWidth: true,
                      ),
                      SpacerHeight5px(),
                      CommonText(
                        title: 'Published: ',
                        text: '${resultFromAPI.published}',
                        halfWidth: true,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: AddBookButton(
                      onPressed: () => showAddPopOut(
                        context: context,
                        categories: categories,
                        uid: uid,
                        resultFromAPI: resultFromAPI,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
