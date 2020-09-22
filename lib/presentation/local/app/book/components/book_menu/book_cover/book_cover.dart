import 'package:booknote/application/book/cover_state_cubit.dart';
import 'package:booknote/domain/book/cover_state.dart';
import 'package:booknote/infrastructure/database/database.dart';
import 'package:booknote/presentation/global/components/big_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/appbar.dart';
import 'components/cover_container.dart';
import 'components/helpers.dart';
import 'components/upload_cover/upload_cover.dart';

class BookCoverArgument {
  BookCoverArgument({
    @required this.book,
    @required this.uid,
  });

  final DocumentSnapshot book;
  final String uid;
}

class BookCover extends StatelessWidget {
  static const routeName = '/book_cover';

  @override
  Widget build(BuildContext context) {
    // get arguments from Menu
    BookCoverArgument arg = ModalRoute.of(context).settings.arguments;

    return BlocProvider<CoverStateCubit>(
      create: (BuildContext context) => CoverStateCubit(
        customImage: arg.book['pathToLocalCustomCover'],
        selectedImage: arg.book['currentImage']['linkPath'],
      ),
      child: BlocBuilder<CoverStateCubit, CoverState>(
        builder: (context, coverState) {
          // Create 'CoverStateCubit' instance
          final CoverStateCubit coverCubit =
              BlocProvider.of<CoverStateCubit>(context);

          // can be null
          String largeImage = arg.book['linkToNetworkLargeCover'];
          // never null
          String smallImage = arg.book['linkToNetworkThumbnailCover'];

          DatabaseService database = DatabaseService(uid: arg.uid);

          String documentID = arg.book.documentID;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              child: BookCoverAppBar(),
              preferredSize: Size.fromHeight(kToolbarHeight),
            ),
            body: Column(
              children: [
                BigTitle(
                  text: 'Choose cover',
                  size: 35.0,
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 20.0,
                    ),
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: 20.0),
                          if (largeImage != null)
                            BookCoverContainer(
                              linkPath: largeImage,
                              network: true,
                              opacity: processOpacity(
                                largeImage,
                                coverState.selectedImage,
                              ),
                              onTap: () {
                                coverCubit.selectCover(largeImage, coverState);
                                database.updateCurrentImage(
                                  largeImage,
                                  true,
                                  documentID,
                                );
                              },
                            ),
                          SizedBox(width: 20.0),
                          BookCoverContainer(
                            linkPath: smallImage,
                            network: true,
                            opacity: processOpacity(
                              smallImage,
                              coverState.selectedImage,
                            ),
                            onTap: () {
                              coverCubit.selectCover(smallImage, coverState);
                              database.updateCurrentImage(
                                smallImage,
                                true,
                                documentID,
                              );
                            },
                          ),
                          SizedBox(width: 20.0),
                          if (coverState.customImage != null)
                            BookCoverContainer(
                              linkPath: coverState.customImage,
                              network: false,
                              opacity: processOpacity(
                                coverState.customImage,
                                coverState.selectedImage,
                              ),
                              onTap: () {
                                coverCubit.selectCover(
                                  coverState.customImage,
                                  coverState,
                                );
                                database.updateCurrentImage(
                                  coverState.customImage,
                                  false,
                                  documentID,
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: UploadBookCover(
                    onTap: getImage,
                    coverCubit: coverCubit,
                    database: database,
                    documentID: documentID,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
