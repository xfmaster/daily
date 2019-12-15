import 'dart:ui' as prefix0;

import 'package:daily_app/base/basic.dart';
import 'package:daily_app/utils/screen_util.dart';
import 'package:daily_app/view/refresh_indicator.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';
import 'dart:ui';

Widget buildView(
    ColumnState state, Dispatch dispatch, ViewService viewService) {
  var adapter = viewService.buildAdapter();
  var top = MediaQueryData.fromWindow(window).padding.top;
  return PlatformScaffold(
    showLoading: state.list == null,
    body: Stack(
      children: <Widget>[
        SmartRefresher(
          scrollController: state.scrollController,
          enablePullDown: false,
          enablePullUp: true,
          primary: false,
          controller: state.controller,
          onLoading: () {
            dispatch(ColumnActionCreator.loadMoreAction());
          },
          footer: CustomDailyFooter(
            height: 60,
          ),
          child: ListView.builder(
            padding: state.appbarAnim ? null : EdgeInsets.only(top: top + 58),
            itemBuilder: adapter.itemBuilder,
            itemCount: adapter.itemCount,
          ),
        ),
        Column(
          children: <Widget>[
            viewService.buildComponent("appbar"),
          ],
        )
      ],
    ),
  );
}
