import 'package:flutter/material.dart';
import 'package:news_app_flutter/bloc/FrontpageBloc.dart';
import 'package:news_app_flutter/common/ArticleListItem.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/screen/home/_widget/LoadMore.dart';
import 'package:news_app_flutter/screen/home/front-page/_widget/HighlightedItem.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  FrontpageBloc _frontpageBloc;
  List<ArticleBasicInfo> listOfArticles = List<ArticleBasicInfo>();

  @override
  void initState() {
    _frontpageBloc = FrontpageBloc(limitation: 10, pagination: 1);
    _frontpageBloc.fetchArticles();
    listenForNewData();
    super.initState();
  }

  @override
  void dispose() {
    _frontpageBloc.dispose();
    super.dispose();
  }

  void listenForNewData() {
    _frontpageBloc.listOfArticlesStream.listen((data) => {
      setState(() => listOfArticles.addAll(data))
    });
  }

  HighlightedItem _buildHighlightedItem(List<ArticleBasicInfo> articles) {
    return HighlightedItem(article: articles[0]);
  }

  List<ArticleListItem> _buildListItem(List<ArticleBasicInfo> articles) {
    List<ArticleListItem> listOfArticle = List<ArticleListItem>();
    articles.asMap().forEach((index, value) => {
      if (index != 0) {
        listOfArticle.add(ArticleListItem(article: value))
      }
    });
    return listOfArticle;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Builder(
          builder: (BuildContext context) {
            if (listOfArticles.length > 0) {
              return Column(
                children: <Widget>[
                  _buildHighlightedItem(listOfArticles),
                  ..._buildListItem(listOfArticles),
                  LoadMore(
                    fetchMore: () => _frontpageBloc.fetchMoreArticles(),
                    onFetchMore: _frontpageBloc.onFetchMore,
                  )
                ],
              );
            }
            return Container(
              padding: EdgeInsets.all(SPACE_DEFAULT),
              alignment: Alignment.center,
              child: CircularProgressIndicator()
            );
          },
        )
      )
    );
  }
}