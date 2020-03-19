import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class ArticlePublisher extends StatelessWidget {
  final String publisher;

  ArticlePublisher({ @required this.publisher });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SPACE_MINIMAL, left: SPACE_DEFAULT, right: SPACE_DEFAULT),
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: SPACE_SMALL, right: SPACE_SMALL),
        margin: EdgeInsets.only(top: SPACE_SMALL),
        color: COLOR_BLACK,
        child: Text(
          publisher,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: COLOR_WHITE,
          )
        )
      )
    );
  }
}