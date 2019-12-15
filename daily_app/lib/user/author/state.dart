import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/base/base_page_state.dart';
import 'package:daily_app/bean/author.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AuthorHomeState extends BasePageState<BaseItem> implements Cloneable<AuthorHomeState> {
  RefreshController refreshController;
  ScrollController scrollController;
  AuthorBean authorBean;
  int id;
  Color backColor;
  Color iconColor;
  bool isVisible;

  @override
  AuthorHomeState clone() {
    return AuthorHomeState()
      ..list = list
      ..isVisible = isVisible
      ..refreshController = refreshController
      ..authorBean = authorBean
      ..iconColor = iconColor
      ..scrollController = scrollController
      ..id = id
      ..backColor = backColor;
  }
}

AuthorHomeState initState(Map<String, dynamic> args) {
  int id = args['id'];
  return AuthorHomeState()
    ..backColor = Colors.transparent
    ..iconColor = AppTheme.getInstance().backColor
    ..refreshController = new RefreshController()
    ..scrollController = new ScrollController()
    ..id = id
    ..isVisible = false;
}
