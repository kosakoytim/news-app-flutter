import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class LoadMore extends StatelessWidget {
  Stream<bool> onFetchMore;
  VoidCallback fetchMore;

  LoadMore({ @required this.onFetchMore , @required this.fetchMore});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: onFetchMore,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == null) {
          return SizedBox();
        } else if (snapshot.data == false) {
          return GestureDetector(
            onTap: (() => {
              fetchMore()
            }),
            child: Container(
              padding: EdgeInsets.fromLTRB(SPACE_DEFAULT, SPACE_SMALL, SPACE_DEFAULT, SPACE_SMALL),
              margin: EdgeInsets.only(bottom: SPACE_DEFAULT),
              decoration: BoxDecoration(
                color: COLOR_BLUE,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text(
                'Load more',
                style: TextStyle(
                  color: COLOR_WHITE
                ),
              ),
            )
          );
        } else if (snapshot.data == true) {
          return Container(
            padding: EdgeInsets.all(SPACE_DEFAULT),
            alignment: Alignment.center,
            child: CircularProgressIndicator()
          );
        }
        return SizedBox();
      },
    );
  }
}