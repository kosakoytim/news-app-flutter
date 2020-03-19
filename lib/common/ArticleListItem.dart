import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/model/Article.dart';
import 'package:news_app_flutter/screen/article-detail/ArticleDetailScreen.dart';

class ArticleListItem extends StatelessWidget {
  final ArticleBasicInfo article;

  ArticleListItem({
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
          decoration: BoxDecoration(
            color: COLOR_WHITE,
            border: Border(
              top: BorderSide(
                color: COLOR_GREY,
                width: 1.0,
                style: BorderStyle.solid
              )
            )
          ),
          padding: EdgeInsets.all(SPACE_DEFAULT),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: SPACE_DEFAULT),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article.title,
                        style: TextStyle(
                          fontSize: FONT_MEDIUM,
                          fontWeight: FontWeight.w400
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
                  )
                )
              ),
              Container(
                color: COLOR_GREY,
                child: Image(
                  image: NetworkImage(article.thumbnail),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                )
              )
            ],
          )
        )
      )
    );
  }
}