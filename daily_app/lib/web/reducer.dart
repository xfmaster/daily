import 'dart:ui';

import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/toolbar/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<WebState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebState>>{
      WebAction.changeColorAlpha: _onAction,
      WebAction.onLoadFinish: _onLoadFinish,
      WebAction.updateInfoAction: _updateInfoAction,
//      WebAction.updateUrlAction: _updateUrlAction,
    },
  );
}

WebState _onAction(WebState state, Action action) {
  final WebState newState = state.clone();
  int alpha = action.payload;
  ToolBarState toolBarState = newState[ComponentKey.toolBar];
  toolBarState = toolBarState.clone();
  var dark = newState.appTheme.dark;
  Color toolbarColor = AppTheme.getInstance().backColor;

  toolBarState.toolbarColor = Color.fromARGB(
      alpha, toolbarColor.red, toolbarColor.green, toolbarColor.blue);

  toolBarState.toolbarTextColor = Color.fromARGB(255, dark ? 255 : 255 - alpha,
      dark ? 255 : 255 - alpha, dark ? 255 : 255 - alpha);
  newState[ComponentKey.toolBar] = toolBarState;
  return newState;
}

WebState _onLoadFinish(WebState state, Action action) {
  println("_onLoadFinish");
  final WebState newState = state.clone()..loading = false;
  return newState;
}

//WebState _updateUrlAction(WebState state, Action action) {
//  println("_onLoadFinish");
//  final WebState newState = state.clone()..url = action.payload;
//  return newState;
//}

WebState _updateInfoAction(WebState state, Action action) {
  println("_updateInfoAction");
  NewsBean bean = action.payload;
  final WebState newState = state.clone()..type = bean.post.pageStyle;
  ToolBarState toolBarState = newState[ComponentKey.toolBar];
  if (newState.type == 1) {
    toolBarState.toolbarColor = Colors.transparent;
    toolBarState.toolbarTextColor = Colors.white;
  } else {
    toolBarState.toolbarColor = Colors.white;
    toolBarState.toolbarTextColor = AppTheme.getInstance().textColor;
  }
  return newState
    ..[ComponentKey.toolBar] = toolBarState.clone()
    ..newsBean = bean;
}
