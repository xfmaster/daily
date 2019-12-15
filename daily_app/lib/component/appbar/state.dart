import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/common/icons.dart';
import 'package:daily_app/component/base_component_state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../component_key.dart';

class AppBarState with BaseComponentState implements Cloneable<AppBarState> {
  ///0、为无（不显示），1、为图片显示对应[iconData]，，2、为文字对应[actionText];默认为0
  int actionType;
  String actionText;
  IconData iconData;
  Color backgroundColor;
  Color textColor;
  String title;
  bool showTabBar;
  List<Tab> tabs;
  TabController controller;

  @override
  AppBarState clone() {
    return AppBarState()
      ..actionType = actionType
      ..title = title
      ..tabs = tabs
      ..controller = controller
      ..showTabBar = showTabBar
      ..iconData = iconData
      ..backgroundColor = backgroundColor
      ..textColor = textColor
      ..actionText = actionText..isInit=isInit;
  }
}

AppBarState initAppBarState(MapLike map) {
  println("initAppBarState===$map");
  AppBarState appBarState = map[ComponentKey.appBar];
  appBarState ??= new AppBarState();
  appBarState.actionType ??= 1;
  appBarState.actionText ??= "完成";
  appBarState.iconData ??= MyIcons.share;
  appBarState.backgroundColor ??= AppTheme.getInstance().backColor;
  appBarState.textColor ??= AppTheme.getInstance().textColor;
  appBarState.title ??= '标题';
  appBarState.showTabBar ??= false;
  appBarState.isInit = true;
  println(appBarState.showTabBar);
  return appBarState;
}
