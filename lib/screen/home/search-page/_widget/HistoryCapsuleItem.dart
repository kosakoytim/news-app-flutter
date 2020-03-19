import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class HistoryCapsuleItem extends StatelessWidget {
  final String query;
  final VoidCallback onTap;

  HistoryCapsuleItem({@required this.query, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onTap()),
      child: Container(
        padding: EdgeInsets.fromLTRB(SPACE_DEFAULT, SPACE_SMALL, SPACE_DEFAULT, SPACE_SMALL),
        margin: EdgeInsets.only(right: SPACE_DEFAULT),
        decoration: BoxDecoration(
          border: Border.all(
            color: COLOR_BLUE,
            style: BorderStyle.solid,
            width: 1.0
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Text(
          query,
          style: TextStyle(
            color: COLOR_BLUE
          ),
        ),
      )
    );
  }
}