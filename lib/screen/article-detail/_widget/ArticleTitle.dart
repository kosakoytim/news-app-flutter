import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class ArticleTitle extends StatelessWidget {
  final String title;

  ArticleTitle({ @required this.title });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        fontSize: FONT_MEDIUM_2,
        fontWeight: FontWeight.w700
      ),
    );
  }
}