import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class HomeState implements GlobalBaseState, Cloneable<HomeState> {
  TabController tabController;
  ScrollController controller;
  bool hide;

  @override
  HomeState clone() {
    return HomeState()
      ..tabController = tabController
      ..controller = controller
      ..appTheme = appTheme
      ..hide = hide;
  }

  @override
  AppTheme appTheme;
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..controller = new ScrollController()
    ..hide = true;
}
