import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class CommonIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(SPACE_MINIMAL, SPACE_MINIMAL, SPACE_DEFAULT, SPACE_MINIMAL),
      child: Image(
        image: AssetImage('lib/asset/flutter_icon.png'),
        width: 40,
        height: 40,
      )
    );
  }
}