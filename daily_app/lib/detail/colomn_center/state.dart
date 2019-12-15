import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ColumnCenterState
    with MapLike, GlobalBaseState
    implements Cloneable<ColumnCenterState> {
  TabController controller;

  @override
  ColumnCenterState clone() {
    return ColumnCenterState()
      ..appTheme = appTheme
      ..[ComponentKey.appBar] = this[ComponentKey.appBar]
      ..controller = controller;
  }

  @override
  AppTheme appTheme;
}

ColumnCenterState initState(Map<String, dynamic> args) {
  AppBarState appBarState = new AppBarState();
  appBarState.title = '栏目中心';
  appBarState.actionType = 0;
  appBarState.showTabBar = true;
  appBarState.tabs = new List();
  appBarState.tabs.add(new Tab(
    child: TitleText('我的订阅'),
  ));
  appBarState.tabs.add(new Tab(
    child: TitleText('所有栏目'),
  ));
  return ColumnCenterState()..[ComponentKey.appBar] = appBarState;
}
