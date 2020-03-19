import 'package:flutter/material.dart';
import 'package:news_app_flutter/bloc/SearchBloc.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/screen/home/search-page/_widget/SearchHistory.dart';

class SearchPageOnNoInput extends StatelessWidget {
  final SearchBloc searchBloc;

  SearchPageOnNoInput({ this.searchBloc });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SPACE_DEFAULT),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Riwayat Pencarian',
            style: TextStyle(
              fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(
            height: SPACE_SMALL,
          ),
          SearchHistory(
            searchBloc: searchBloc,
          )
        ],
      )
    );
  }
}