import 'dart:convert';

import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/toolbar/state.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter/widgets.dart' as prefix0;
import 'package:webview_flutter/webview_flutter.dart';

import 'action.dart';
import 'state.dart';

AnimationController _translateController;
CurvedAnimation _curve;

Effect<WebState> buildEffect() {
  return combineEffects(<Object, Effect<WebState>>{
    Lifecycle.initState: _init,
    WebAction.webContentOnclick: _webContentOnclick
  });
}

void _webContentOnclick(Action action, Context<WebState> ctx) {
  JavascriptMessage message = action.payload;
  var msgJson = message.message;
  Map<String, dynamic> decode = json.decode(msgJson);
  switch (message.type) {
    case "category":
      appPush("column", ctx.context, params: {
        "title": decode['name'],
        "id": int.parse(decode['id']),
        'isAnim': false,
        'hideAction': true,
        'api': API_COLUMN_CATEGORY
      });
      break;
    case "tag":
      appPush("column", ctx.context, params: {
        "title": decode['name'],
        "id": int.parse(decode['id']),
        'isAnim': false,
        'hideAction': true,
        'api': API_ARTICLE_TAG
      });
      break;
    case "related":
      Map<String, dynamic> map = new Map.from(decode);
      map["type"] = ctx.state.type;
      String url = decode['url'];
      var substring = url.substring(ctx.state.url.lastIndexOf("/"));
      map['url'] = "http://app3.qdaily.com/app3/articles/" + substring;
      if (decode.containsKey("commentCount")) {
        String commentCount = decode["commentCount"];
        map["comment"] = int.parse(commentCount);
      }
      if (decode.containsKey("collectCount")) {
        map["collect"] = int.parse(decode["collectCount"]);
      }
      map['id'] = int.parse(substring.split(".")[0]);
      appPush("webview", ctx.context, params: map);
      println("$map---------------");
      break;
    case "author":
      //author
      appPush("author", ctx.context, params: {
        "id": int.parse(decode['id']),
      });
      break;
  }
}

void _init(Action action, Context<WebState> ctx) {
  double tempY = 0.0;
  ctx.state.scrollYListener = (double offsetY) {
    if (ctx.state.type == 0) {
      if (offsetY - tempY > 0 && !_translateController.isAnimating) {
        _translateController.forward();
      } else {
        if (!_translateController.isAnimating) _translateController.reverse();
      }
    } else {
      if (offsetY < 150) {
        int alpha = (offsetY * (255 / 150)).toInt();
        ctx.dispatch(WebActionCreator.changeColorAlpha(alpha));
      } else {
        if (offsetY - tempY > 0 && !_translateController.isAnimating) {
          _translateController.forward();
        } else if (!_translateController.isAnimating) {
          _translateController.reverse();
        }
        ToolBarState state = ctx.state[ComponentKey.toolBar];
        if (state.toolbarColor.alpha < 255 && offsetY > 150) {
          ctx.dispatch(WebActionCreator.changeColorAlpha(255));
        }
      }
    }
    tempY = offsetY;
  };
  TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  _translateController = AnimationController(
      vsync: tickerProvider, duration: const Duration(milliseconds: 200));
  _curve = CurvedAnimation(parent: _translateController, curve: Curves.linear);
  ctx.state.translateAnimation =
      Tween(begin: Offset(0, 0), end: Offset(0, 1)).animate(_curve);
  _requestInfoData(ctx);
}

///通过id获取新闻详情数据
void _requestInfoData(Context<WebState> ctx) {
  var id = ctx.state.id;
  requestGet(API_ARTICLE_INFO + "$id.json").then((res) {
    if (res['error'] == 400) return;
    println("_requestInfoData==$res");
    var newsBean = NewsBean.fromJson(res);
    ctx.dispatch(WebActionCreator.updateInfoAction(newsBean));
  });
//  requestGet(API_ARTICLE_DETAIL + "$id.json").then((res) {
//    if (res['error'] == 400) return;
//    ctx.dispatch(WebActionCreator.updateUrlAction(res['article']['body']));
//  });
}
