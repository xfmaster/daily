import 'package:daily_app/base/basic.dart';
import 'package:daily_app/view/refresh_indicator.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return SmartRefresher(
    controller: state.refreshController,
    enablePullDown: true,
    enablePullUp: true,
    header: CustomDailyHeader(),
    footer: CustomDailyFooter(),
    onRefresh: () {
      dispatch(IndexActionCreator.refreshAction());
    },
    onLoading: () {
      dispatch(IndexActionCreator.loadAction());
    },
    child: CustomScrollView(
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
              viewService.context),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
              childCount: buildAdapter.itemCount),
        )
      ],
    ),
  );
}
