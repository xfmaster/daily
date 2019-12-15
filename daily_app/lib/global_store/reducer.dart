import 'dart:ui';

import 'package:daily_app/base/app_theme.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
    },
  );
}


GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  print("_onchangeThemeColor");
  AppTheme.resetAppTheme(action.payload);
  AppTheme appTheme = AppTheme.getInstance();
  return state.clone()..appTheme = appTheme;
}
