import 'package:flutter/material.dart';
import 'package:news_app_flutter/bloc/SearchBloc.dart';
import 'package:news_app_flutter/common/ArticleListItem.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/screen/home/_widget/LoadMore.dart';
import 'package:news_app_flutter/screen/home/search-page/_widget/SearchStatus.dart';

class SearchPageOnInput extends StatefulWidget {
  final SearchBloc searchBloc;

  SearchPageOnInput({ this.searchBloc });

  @override
  _SearchPageOnInputState createState() => _SearchPageOnInputState();
}

class _SearchPageOnInputState extends State<SearchPageOnInput> {

  SearchStatus _buildSearchStatus(List<ArticleBasicInfo> articles) {
    return SearchStatus(status: widget.searchBloc.getSearchStatusText(articles: articles));
  }

  List<ArticleListItem> _buildListItem(List<ArticleBasicInfo> articles) {
    List<ArticleListItem> listOfArticle = List<ArticleListItem>();
    articles.asMap().forEach((index, value) => {
      listOfArticle.add(ArticleListItem(article: value))
    });
    return listOfArticle;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: StreamBuilder(
          stream: widget.searchBloc.listOfArticlesStream,
          builder: (context, AsyncSnapshot<List<ArticleBasicInfo>> snapshot) {
            if (snapshot.data != null) {
              return Column(
                children: <Widget>[
                  _buildSearchStatus(snapshot.data),
                  ..._buildListItem(snapshot.data),
                  LoadMore(
                    onFetchMore: widget.searchBloc.onFetchMore, 
                    fetchMore: () => widget.searchBloc.fetchMoreArticles()
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