import 'package:daily_app/base/basic.dart';
import 'package:daily_app/view/refresh_indicator.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AllColumnState state, Dispatch dispatch, ViewService viewService) {
  var adapter = viewService.buildAdapter();
  return PlatformScaffold(
    showLoading: state.list == null,
    body: SmartRefresher(
      controller: state.refreshController,
      enablePullUp: true,
      enablePullDown: true,
      onLoading: () {
        dispatch(AllColumnActionCreator.loadMoreAction());
      },
      onRefresh: () {
        dispatch(AllColumnActionCreator.refreshAction());
      },
      footer: CustomDailyFooter(height: 80),
      header: CustomDailyHeader(),
      child: ListView.builder(
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount,
      ),
    ),
  );
}
