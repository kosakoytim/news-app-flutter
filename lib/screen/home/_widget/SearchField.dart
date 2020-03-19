import 'package:flutter/material.dart';
import 'package:news_app_flutter/bloc/SearchBloc.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class SearchField extends StatelessWidget {
  final SearchBloc searchBloc;

  SearchField({ @required this.searchBloc });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, bottom: 0),
      child: TextField(
        controller: searchBloc.searchFieldController,
        style: TextStyle(
          fontSize: FONT_MEDIUM_2,
        ),
        onTap: () => {
          searchBloc.loadSearchHistory(),
          searchBloc.setSearchActivity(searchActivitySet: SearchActivity.ON_SEARCH_HISTORY)
        },
        onSubmitted: (text) => {
          searchBloc.addToSearchHistory(query: text),
          searchBloc.searchArticles(query: text, paginate: 1)
        },
        decoration: InputDecoration(
          hintText: 'Search news...',
          contentPadding: EdgeInsets.fromLTRB(SPACE_DEFAULT, SPACE_MINIMAL, SPACE_DEFAULT, SPACE_MINIMAL),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: COLOR_BLUE,
              width: 1.0
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: COLOR_SEMI_BLACK,
              width: 1.0
            )
          ),

        )
      ),
    );
  }
}