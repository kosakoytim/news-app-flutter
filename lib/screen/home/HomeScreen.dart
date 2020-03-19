import 'package:flutter/material.dart';
import 'package:news_app_flutter/bloc/SearchBloc.dart';
import 'package:news_app_flutter/common/BackNavigator.dart';
import 'package:news_app_flutter/common/TopBar.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/screen/home/_widget/CommonIcon.dart';
import 'package:news_app_flutter/screen/home/_widget/SearchField.dart';
import 'package:news_app_flutter/screen/home/front-page/FrontPage.dart';
import 'package:news_app_flutter/screen/home/search-page/SearchPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchBloc searchBloc;

  @override
  void initState() {
    searchBloc = SearchBloc(limitation: 10, pagination: 1);
    super.initState();
  }

  @override
  void dispose() {
    searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            UnderTopBar(
              widget: StreamBuilder(
                stream: searchBloc.searchActivity,
                builder: (context, AsyncSnapshot<SearchActivity> snapshot) {
                  if (snapshot.data != null) {
                    switch (snapshot.data) {
                      case SearchActivity.INACTIVE:
                        return FrontPage();
                        break;
                      default:
                        return SearchPage(searchBloc: searchBloc);
                    }
                  }
                  return CircularProgressIndicator();
                },
              )
            ),
            TopBar(
              leftColumn: StreamBuilder(
                stream: searchBloc.searchActivity,
                builder: (context, AsyncSnapshot<SearchActivity> snapshot) {
                  if (snapshot.data != null) {
                    switch (snapshot.data) {
                      case SearchActivity.INACTIVE:
                        return CommonIcon();
                        break;
                      default:
                        return BackNavigator(onBack: () => {
                          searchBloc.setSearchFieldText(query: ""),
                          searchBloc.setSearchActivity(searchActivitySet: SearchActivity.INACTIVE),
                          FocusScope.of(context).requestFocus(FocusNode())
                        });
                    }
                  }
                  return CircularProgressIndicator();
                },
              ),
              mainColumn: SearchField(
                searchBloc: searchBloc,
              ),
            ),
          ]
        )
      )
    );
  }
}