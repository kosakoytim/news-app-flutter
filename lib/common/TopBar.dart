import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class TopBar extends StatelessWidget {
  final Widget leftColumn;
  final Widget mainColumn;

  TopBar({ @required this.leftColumn, @required this.mainColumn });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        boxShadow: [
          BoxShadow(
            color: COLOR_BLACK.withOpacity(0.1),
            blurRadius: 5.0,
            offset: Offset(0, 7),
          )
        ]
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: SPACE_DEFAULT,
        right: SPACE_DEFAULT,
        top: SPACE_MINIMAL,
        bottom: SPACE_MINIMAL
      ),
      child: Row(
        children: <Widget>[
          LeftSideColumn(widget: leftColumn),
          MainColumn(widget: mainColumn)
        ],
      )
    );
  }
}

class LeftSideColumn extends StatelessWidget {
  final Widget widget;

  LeftSideColumn({ @required this.widget });

  @override
  Widget build(BuildContext context) {
    return widget;
  }
}

class MainColumn extends StatelessWidget {
  final Widget widget;

  MainColumn({ @required this.widget });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget
    );
  }
}

class UnderTopBar extends StatelessWidget {
  final Widget widget;

  UnderTopBar({ this.widget });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 65),
      child: widget
    );
  }
}