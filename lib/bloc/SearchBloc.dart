import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/service/DataManager.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  int pagination = 1;
  int limitation = 10;
  List<ArticleBasicInfo> articlePile = List<ArticleBasicInfo>();
  TextEditingController searchFieldController = TextEditingController();
  BehaviorSubject<List<ArticleBasicInfo>> _subjectListOfArticles = BehaviorSubject<List<ArticleBasicInfo>>();
  BehaviorSubject<SearchActivity> _subjectSearchActivity = BehaviorSubject<SearchActivity>();
  BehaviorSubject<List<String>> _subjectSearchHistory = BehaviorSubject<List<String>>();
  BehaviorSubject<bool> _subjectOnFetchMore = BehaviorSubject<bool>();

  SearchBloc({this.pagination, this.limitation}) {
    _subjectSearchActivity = BehaviorSubject<SearchActivity>.seeded(SearchActivity.INACTIVE);
    _subjectOnFetchMore = BehaviorSubject<bool>.seeded(false);
    loadSearchHistory();
  }

  Stream<List<ArticleBasicInfo>> get listOfArticlesStream => _subjectListOfArticles.stream;
  Stream<SearchActivity> get searchActivity => _subjectSearchActivity.stream;
  Stream<List<String>> get searchHistory => _subjectSearchHistory.stream;
  Stream<bool> get onFetchMore => _subjectOnFetchMore.stream;

  void dispose() {
    searchFieldController.dispose();
    _subjectListOfArticles.close();
    _subjectSearchActivity.close();
    _subjectSearchHistory.close();
    _subjectOnFetchMore.close();
  }

  void setSearchFieldText({ @required String query }) {
    searchFieldController.text = query;
  }

  void searchArticles({int limiter, int paginate, @required String query}) {
    if (query == "") { return; }
    if (paginate != null) { pagination = paginate; }
    if (limiter != null) { limitation = limiter; }
    _subjectSearchActivity.sink.add(SearchActivity.ON_DISPLAY_DATA);
    DataManager().fetchArticles(
      limit: limitation,
      page: pagination,
      query: query
    ).then((value) => {
      if (value.length == 0 || value.length < limitation) {
        _subjectOnFetchMore.sink.add(null)
      } else {
        _subjectOnFetchMore.sink.add(false)
      },
      articlePile = List<ArticleBasicInfo>(),
      articlePile.addAll(value),
      _subjectListOfArticles.sink.add(articlePile)
    });
  }

  void fetchMoreArticles() {
    _subjectOnFetchMore.sink.add(true);
    pagination += 1;
    DataManager().fetchArticles(
      limit: limitation,
      page: pagination,
      query: searchFieldController.text
    ).then((value) => {
      if (value.length == 0 || value.length < limitation) {
        _subjectOnFetchMore.sink.add(null)
      } else {
        _subjectOnFetchMore.sink.add(false)
      },
      articlePile.addAll(value),
      _subjectListOfArticles.sink.add(articlePile),
    }).catchError((error) => {
      _subjectOnFetchMore.sink.add(null),
    });
  }

  void addToSearchHistory({ @required String query }) {
    if (query == "") { return; }
    DataManager().addSearchHistory(query: query);
  }

  void loadSearchHistory() {
    DataManager().getSearchHistory()
      .then((value) => {
        _subjectSearchHistory.sink.add(getRecentSearchHistoryOnly(value))
      });
  }

  List<String> getRecentSearchHistoryOnly(List<String> value) {
    const qty = 5;
    var searchHistoryCount = value.length;
    List<String> list = List<String>();
    if (searchHistoryCount < qty) {
      for (var i = 0; i < searchHistoryCount; i++) {
        list.add(value[searchHistoryCount - 1 - i]);
      }
    } else {
      for (var i = 0; i < qty; i++) {
        list.add(value[searchHistoryCount - 1 - i]);
      }
    }
    return list;
  }

  void setSearchActivity({ @required SearchActivity searchActivitySet }) {
    _subjectSearchActivity.sink.add(searchActivitySet);
  }

  String getSearchStatusText({ @required List<ArticleBasicInfo> articles }) {
    if (articles.length == 0) {
      return "Berita tidak ditemukan";
    } else {
      return "Menampilkan ${articles.length} hasil pencarian";
    }
  }
}

enum SearchActivity {
  ON_DISPLAY_DATA, ON_SEARCH_HISTORY, INACTIVE
}