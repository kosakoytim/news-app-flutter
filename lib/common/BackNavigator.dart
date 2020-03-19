import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';

class BackNavigator extends StatelessWidget {
  VoidCallback onBack;

  BackNavigator({ this.onBack });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(SPACE_MINIMAL, SPACE_SMALL, SPACE_DEFAULT, SPACE_SMALL),
        child: Image(
          image: AssetImage('lib/asset/back.png'),
          width: SPACE_DEFAULT,
          height: SPACE_DEFAULT,
        )
      ),
      onTap: (() => {
        if (onBack != null) {
          onBack()
        } else {
          Navigator.pop(context)
        }
      }),
    );
  }
}