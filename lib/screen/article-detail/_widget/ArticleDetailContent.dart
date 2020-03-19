import 'package:flutter/material.dart';
import 'package:news_app_flutter/bloc/ArticleDetailBloc.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/screen/article-detail/_widget/ArticleContent.dart';
import 'package:news_app_flutter/screen/article-detail/_widget/ArticlePublisher.dart';
import 'package:news_app_flutter/screen/article-detail/_widget/HeroImage.dart';

class ArticleDetailContent extends StatefulWidget {
  final ArticleBasicInfo articleBasicInfo;

  ArticleDetailContent({ @required this.articleBasicInfo });

  @override
  _ArticleDetailContentState createState() => _ArticleDetailContentState();
}

class _ArticleDetailContentState extends State<ArticleDetailContent> {
  ArticleDetailBloc _articleDetailBloc;

  @override
  void initState() {
    _articleDetailBloc = ArticleDetailBloc();
    _articleDetailBloc.getArticleDetail(id: widget.articleBasicInfo.id);
    super.initState();
  }

  @override
  void dispose() {
    _articleDetailBloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            HeroImage(thumbnail: widget.articleBasicInfo.thumbnail),
            ArticlePublisher(publisher: widget.articleBasicInfo.publisher),
            StreamBuilder(
              stream: _articleDetailBloc.articleDetail,
              builder: (context, AsyncSnapshot<ArticleDetail> snapshot) {
                if (snapshot.data != null) {
                  return ArticleContent(content: snapshot.data.content);
                }
                return CircularProgressIndicator();
              },
            )
          ],
        )
      ),
    );
  }
}