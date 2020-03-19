import 'package:flutter/material.dart';
import 'package:news_app_flutter/bloc/SearchBloc.dart';
import 'package:news_app_flutter/screen/home/search-page/_widget/SearchPageOnInput.dart';
import 'package:news_app_flutter/screen/home/search-page/_widget/SearchPageOnNoInput.dart';

class SearchPage extends StatefulWidget {
  final SearchBloc searchBloc;

  SearchPage({ this.searchBloc });

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  Widget _buildSearchPageSection(SearchActivity searchActivity) {
    switch (searchActivity) {
      case SearchActivity.ON_DISPLAY_DATA:
        return SearchPageOnInput(searchBloc: widget.searchBloc);
        break;
      case SearchActivity.ON_SEARCH_HISTORY:
        return SearchPageOnNoInput(searchBloc: widget.searchBloc);
      default:
        return SearchPageOnNoInput(searchBloc: widget.searchBloc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.searchBloc.searchActivity,
      builder: (context, AsyncSnapshot<SearchActivity> snapshot) {
        if (snapshot.data != null) {
          return _buildSearchPageSection(snapshot.data);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
