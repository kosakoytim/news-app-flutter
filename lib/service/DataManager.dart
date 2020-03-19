import 'dart:async'; 
import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/constant/API.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManager {
  Future<List<ArticleBasicInfo>> fetchArticles({
    int limit: 10,
    String query,
    int page: 1
  }) async {
    String queryBuilder = "";
    queryBuilder += "?_limit=" + limit.toString();
    queryBuilder += "&_page=" + page.toString();
    if (query != null) { queryBuilder += "&q=" + query.toString(); }
    final response = await http.get(BASE_HOST + '/articles' + queryBuilder);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<ArticleBasicInfo>((json) =>ArticleBasicInfo.fromMap(json)).toList(); 
    } else {
      throw Exception('Fetch data error');
    }
  }

  Future<ArticleDetail> getArticleDetail({
    @required String id,
  }) async {
    final response = await http.get(BASE_HOST + '/articles/' + id);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return ArticleDetail.fromMap(parsed);
    } else {
      throw Exception('Fetch data error');
    }
  }

  void addSearchHistory({ @required String query }) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'search_history';
    List<String> inStorage = prefs.getStringList(key);
    if (inStorage != null) {
      inStorage.add(query);
    } else {
      inStorage = List<String>();
      inStorage.add(query);
    }
    prefs.setStringList(key, inStorage);
  }

  Future<List<String>> getSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'search_history';
    List<String> inStorage = prefs.getStringList(key);
    return inStorage;
  }
}