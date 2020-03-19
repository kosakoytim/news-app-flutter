import 'package:flutter/foundation.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/service/DataManager.dart';
import 'package:rxdart/rxdart.dart';

class ArticleDetailBloc {
  BehaviorSubject<ArticleDetail> _subjectArticleDetail = BehaviorSubject<ArticleDetail>();

  ArticleDetailBloc();

  Stream<ArticleDetail> get articleDetail => _subjectArticleDetail.stream;

  void dispose() {
    _subjectArticleDetail.close();
  }

  void getArticleDetail({ @required String id }) {
    DataManager().getArticleDetail(id: id)
      .then((value) => {
        _subjectArticleDetail.sink.add(value)
      }); 
  }
}