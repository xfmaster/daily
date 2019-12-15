import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/base/base_page_state.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:daily_app/http/api.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Column;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ColumnState extends BasePageState
    with MapLike
    implements GlobalBaseState, Cloneable<ColumnState> {
  RefreshController controller;
  List<BaseItem> list;
  int id;
  ScrollController scrollController;
  ColumnList columnList;
  bool appbarAnim;
  String api;

  @override
  ColumnState clone() {
    return ColumnState()
      ..id = id
      ..api = api
      ..appbarAnim = appbarAnim
      ..list = list
      ..columnList = columnList
      ..controller = controller
      ..scrollController = scrollController
      ..appTheme = appTheme
      ..[ComponentKey.appBar] = this[ComponentKey.appBar];
  }

  @override
  AppTheme appTheme;
}

ColumnState initState(Map<String, dynamic> args) {
  AppBarState appBarState = new AppBarState();
  appBarState.title = args['title'];
  if (args['api'] == null) {
    appBarState.backgroundColor = Colors.transparent;
    appBarState.textColor = Colors.white;
  }
  String api = (args['api'] ??= API_COLUMN_LIST);
  bool appbarAnim = (args['isAnim'] ?? true);
  bool hideAction = (args['hideAction'] ?? false);
  if (hideAction) appBarState.actionType = 0;
  return ColumnState()
    ..controller = new RefreshController()
    ..appbarAnim = appbarAnim
    ..api = api
    ..scrollController = new ScrollController()
    ..[ComponentKey.appBar] = appBarState
    ..id = args['id'];
}
