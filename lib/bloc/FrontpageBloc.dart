import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/service/DataManager.dart';
import 'package:rxdart/rxdart.dart';

class FrontpageBloc {
  int pagination = 1;
  int limitation = 10;
  PublishSubject<List<ArticleBasicInfo>> _subjectListOfArticles = PublishSubject<List<ArticleBasicInfo>>();
  BehaviorSubject<bool> _subjectOnFetchMore = BehaviorSubject<bool>();

  FrontpageBloc({this.pagination, this.limitation}) {
    _subjectOnFetchMore = BehaviorSubject<bool>.seeded(false);
  }

  Stream<List<ArticleBasicInfo>> get listOfArticlesStream => _subjectListOfArticles.stream;
  Stream<bool> get onFetchMore => _subjectOnFetchMore.stream;

  void dispose() {
    _subjectListOfArticles.close();
    _subjectOnFetchMore.close();
  }

  void fetchArticles({int limiter, int paginate}) {
    if (paginate != null) { pagination = paginate; }
    if (limiter != null) { limitation = limiter; }
    DataManager().fetchArticles(
      limit: limitation,
      page: pagination
    ).then((value) => {
      _subjectListOfArticles.sink.add(value)
    });
  }

  void fetchMoreArticles() {
    _subjectOnFetchMore.sink.add(true);
    pagination += 1;
    DataManager().fetchArticles(
      limit: limitation,
      page: pagination
    ).then((value) => {
      if (value.length == 0) {
        _subjectOnFetchMore.sink.add(null)
      } else {
        _subjectOnFetchMore.sink.add(false)
      },
      _subjectListOfArticles.sink.add(value),
    }).catchError((error) => {
      _subjectOnFetchMore.sink.add(null),
    });
  }
}