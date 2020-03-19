import 'package:flutter/material.dart';
import 'package:news_app_flutter/bloc/SearchBloc.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/screen/home/search-page/_widget/HistoryCapsuleItem.dart';

class SearchHistory extends StatelessWidget {
  final SearchBloc searchBloc;

  SearchHistory({ this.searchBloc });

  Widget _displaySearchHistory(List<String> history, BuildContext context) {
    return Wrap(
      runSpacing: SPACE_SMALL,
      children: history.map((query) => 
        HistoryCapsuleItem(
          query: query,
          onTap: () => {
            searchBloc.setSearchFieldText(query: query),
            searchBloc.searchArticles(query: query, paginate: 1),
            FocusScope.of(context).requestFocus(FocusNode())
          },
        )
      ).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: searchBloc.searchHistory,
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.data != null) {
            return _displaySearchHistory(snapshot.data,context);
          }
          return SizedBox();
        },
      )
    );
  }
}