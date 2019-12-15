import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/toolbar/state.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/src/webview_method_channel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebState with MapLike implements GlobalBaseState, Cloneable<WebState> {
  String url;
  int type;
  bool loading;
  NewsBean newsBean;
  Animation<Offset> translateAnimation;
  OnScrollYListener scrollYListener;
  WebViewController webViewController;
  int id;

  @override
  WebState clone() {
    return WebState()
      ..url = url
      ..type = type
      ..[ComponentKey.toolBar] = this[ComponentKey.toolBar]
      ..appTheme = appTheme
      ..webViewController = webViewController
      ..loading = loading
      ..id = id
      ..newsBean = newsBean
      ..translateAnimation = translateAnimation
      ..scrollYListener = scrollYListener;
  }

  @override
  AppTheme appTheme;
}

WebState initState(Map<String, dynamic> args) {
//  String url = args['url'];
  int id = args['id'];
  String url = args['url'];
  int type = (args['type'] == null ? 1 : args['type']);
  int comment = args['comment'] ??= 0;
  int collect = args['collect'] ??= 0;
  ToolBarState toolBarState = new ToolBarState();
  toolBarState.showComment = true;
  toolBarState.showCollect = true;
  toolBarState.comment = comment;
  toolBarState.collect = collect;
  println(type);
  if (type == 1) {
    toolBarState.toolbarColor = Colors.transparent;
    toolBarState.toolbarTextColor = Colors.white;
  } else {
    toolBarState.toolbarColor = Colors.white;
    toolBarState.toolbarTextColor = AppTheme.getInstance().textColor;
  }
  return WebState()
    ..loading = true
    ..url = url
    ..id = id
    ..type = type
    ..[ComponentKey.toolBar] = toolBarState;
}
