import 'package:flutter/material.dart';
import 'package:news_app_flutter/common/BackNavigator.dart';
import 'package:news_app_flutter/common/TopBar.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/screen/article-detail/_widget/ArticleDetailContent.dart';
import 'package:news_app_flutter/screen/article-detail/_widget/ArticleTitle.dart';

class ArticleDetailScreen extends StatefulWidget {
  final ArticleBasicInfo articleBasicInfo;

  ArticleDetailScreen({ @required this.articleBasicInfo });

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            UnderTopBar(
              widget: ArticleDetailContent(
                articleBasicInfo: widget.articleBasicInfo,
              ),
            ),
            TopBar(
              leftColumn: BackNavigator(),
              mainColumn: ArticleTitle(title: widget.articleBasicInfo.title),
            ),
          ]
        )
      )
    );
  }
}