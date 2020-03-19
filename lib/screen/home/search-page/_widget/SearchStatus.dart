import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class SearchStatus extends StatelessWidget {
  final String status;

  SearchStatus({ this.status });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(SPACE_DEFAULT),
      decoration: BoxDecoration(
        color: COLOR_BLUE,
      ),
      child: Text(
        status,
        style: TextStyle(
          color: COLOR_WHITE,
          fontWeight: FontWeight.w300
        ),
      ),
    );
  }
}