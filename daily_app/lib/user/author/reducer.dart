import 'dart:ui';

import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/bean/author.dart';
import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:daily_app/user/author/head/author_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AuthorHomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthorHomeState>>{
      AuthorHomeAction.updateDataAction: _updateDataAction,
      AuthorHomeAction.changeAppbarAlpha: _changeAppbarAlpha,
      AuthorHomeAction.updateTitleVisible: _updateTitleVisible,
    },
  );
}

AuthorHomeState _updateDataAction(AuthorHomeState state, Action action) {
  AuthorBean authorBean = action.payload;
  final AuthorHomeState newState = state.clone()..authorBean = authorBean;
  if (authorBean.isRefresh) {
    newState.list = new List();
    newState.list.add(initAuthorItemState(authorBean.p));
  }
  for (var value in newState.authorBean.list) {
    newState.list.add(initNewsItemState(value));
  }
  return newState;
}

AuthorHomeState _changeAppbarAlpha(AuthorHomeState state, Action action) {
  int alpha = action.payload;
  final AuthorHomeState newState = state.clone();
  var color = AppTheme.getInstance().backColor;
  var dark = AppTheme.getInstance().dark;
  Color newColor = Color.fromARGB(alpha, color.red, color.green, color.blue);
  newState.backColor = newColor;
  println(255 - alpha);
  newState.iconColor = Color.fromARGB(255, dark ? alpha : 255 - alpha,
      dark ? alpha : 255 - alpha, dark ? alpha : 255 - alpha);
  return newState;
}

AuthorHomeState _updateTitleVisible(AuthorHomeState state, Action action) {
  final AuthorHomeState newState = state.clone()..isVisible = action.payload;
  return newState;
}
