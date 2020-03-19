import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class ArticleContent extends StatelessWidget {
  final List<dynamic> content;

  ArticleContent({ this.content });

  Widget _getArticleContent(List<dynamic> contents) {
    return Column(
      children: contents.map((content) => 
        HtmlWidget(content)
      ).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(SPACE_SMALL),
      child: _getArticleContent(content),
    );
  }
}