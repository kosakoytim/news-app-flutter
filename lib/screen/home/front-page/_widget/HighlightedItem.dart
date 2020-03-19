import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/screen/article-detail/ArticleDetailScreen.dart';

class HighlightedItem extends StatelessWidget {
  final ArticleBasicInfo article;

  HighlightedItem({
    @required this.article
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: COLOR_BLUE,
      child: InkWell(
        onTap: (() => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailScreen(articleBasicInfo: article),
            )
          )
        }),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: COLOR_GREY,
          child: Stack(
            children: <Widget>[
              Image(
                image: NetworkImage(article.thumbnail),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: 250,
              ),
              Container(
                height: 250,
                padding: EdgeInsets.all(SPACE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      article.title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: COLOR_WHITE,
                        fontSize: FONT_LARGE,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: COLOR_BLACK,
                            offset: Offset(1, 1)
                          )
                        ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: SPACE_SMALL, right: SPACE_SMALL),
                      margin: EdgeInsets.only(top: SPACE_SMALL),
                      color: COLOR_BLACK,
                      child: Text(
                        article.publisher,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: COLOR_WHITE,
                        )
                      )
                    ),
                  ],
                ),
              )
            ],
          )
        )
      )
    );
    
    
  }
}