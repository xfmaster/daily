import 'dart:ui';

import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/detail/column/head/state.dart';
import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ColumnState> buildReducer() {
  return asReducer(
    <Object, Reducer<ColumnState>>{
      ColumnAction.updateColumnTop: _updateColumnTop,
      ColumnAction.changeAppbarAlpha: _changeAppbarAlpha,
      ColumnAction.updateListAction: _updateListAction,
    },
  );
}

///更新顶部数据
ColumnState _updateColumnTop(ColumnState state, Action action) {
  final ColumnState newState = state.clone();
  Column column = action.payload;
  newState.list ??= new List();
  newState.list
      .add(initColumnHeadState(new ColumnData(false, 0, 0, column, null, 0)));
  return newState;
}

///更新列表数据
ColumnState _updateListAction(ColumnState state, Action action) {
  final ColumnState newState = state.clone();
  ColumnList columnList = action.payload;
  newState.list ??= new List();
  columnList.beans.forEach((bean) {
    newState.list.add(initNewsItemState(bean));
  });
  return newState..columnList = columnList;
}

///更新AppBar背景和字体颜色透明度
ColumnState _changeAppbarAlpha(ColumnState state, Action action) {
  int alpha = action.payload;
  final ColumnState newState = state.clone();
  AppBarState appBarState = newState['appbar'];
  var barState = appBarState.clone();
  var backgroundColor = AppTheme.getInstance().backColor;
  Color newColor = Color.fromARGB(
      alpha, backgroundColor.red, backgroundColor.green, backgroundColor.blue);
  barState.backgroundColor = newColor;
  var dark = AppTheme.getInstance().dark;

  newColor = Color.fromARGB(255, dark ? alpha : 255 - alpha,
      dark ? alpha : 255 - alpha, dark ? alpha : 255 - alpha);
  barState.textColor = newColor;
  newState['appbar'] = barState;
  return newState;
}
