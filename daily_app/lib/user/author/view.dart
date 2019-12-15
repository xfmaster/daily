import 'dart:ui';

import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/base/basic.dart';
import 'package:daily_app/common/icons.dart';
import 'package:daily_app/component/appbar/action.dart';
import 'package:daily_app/view/refresh_indicator.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AuthorHomeState state, Dispatch dispatch, ViewService viewService) {
  var top = MediaQueryData.fromWindow(window).padding.top;
  var name = state.authorBean?.p?.name;
  name = (name == null ? '' : name);
  var adapter = viewService.buildAdapter();
  var dark = AppTheme.getInstance().dark;
  return PlatformScaffold(
      body: Stack(
    children: <Widget>[
      SmartRefresher(
          controller: state.refreshController,
          enablePullDown: false,
          enablePullUp: true,
          onLoading: () {
            dispatch(AuthorHomeActionCreator.loadMoreAction());
          },
          footer: CustomDailyFooter(),
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            controller: state.scrollController,
            itemBuilder: adapter.itemBuilder,
            itemCount: adapter.itemCount,
          )),
      Container(
        color: state.backColor,
        height: 48 + top,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: state.isVisible,
              child: Padding(
                  padding: EdgeInsets.only(top: top + 5),
                  child: TitleText(name)),
            ),
          ],
        ),
      ),
      Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: top + 10, left: 10),
              child: GestureDetector(
                onTap: () {
                  dispatch(AuthorHomeActionCreator.backAction());
                },
                child: Icon(
                  MyIcons.back,
                  color: state.iconColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ));
}
