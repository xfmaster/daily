import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/global_store/action.dart';
import 'package:daily_app/home/index/column/action.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:daily_app/utils/screen_util.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/widgets.dart' hide Action, Column;
import 'action.dart';
import 'state.dart';
import 'dart:math';

double itemWidth;

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    Lifecycle.initState: _init,
    Lifecycle.build: _build,
    IndexAction.refreshAction: _init,
    IndexAction.loadAction: _loadAction,
  });
}

void _build(Action action, Context<IndexState> ctx) {
  itemWidth = prefix0.MediaQuery.of(ctx.context).size.width;
}

void _loadAction(Action action, Context<IndexState> ctx) {
  //加载更多action
  var data = ctx.state.data;
  println("data=$data");
  if (ctx.state.data.has_more) {
    var lastKey = ctx.state.data.last_key; //这个是上一页数据的last_key作为上拉加载的参数
    requestGet(API_INDEX_REFRESH + '$lastKey.json').then((res) {
      if (res['error'] == 400) return;
      ctx.dispatch(IndexActionCreator.loadDataAction(_bindData(res, ctx)));
      ctx.state.refreshController.loadComplete();
    });
  }
}

void _init(Action action, Context<IndexState> ctx) {
  //第一次进来初始化和刷新获取数据action
  requestGet(API_INDEX_REFRESH + '0.json').then((res) {
    if (res['error'] == 400) return;
    ctx.dispatch(IndexActionCreator.refreshDataAction(_bindData(res, ctx)));
    ctx.state.refreshController.refreshCompleted();
  });
}

Data _bindData(res, Context<IndexState> ctx) {
  //json数据绑定
  List<NewsBean> feedList = bindNewsList('feeds', res);
  List<NewsBean> bannerList = bindNewsList('banners', res);
  var columnsJson = res['columns'];
  List<Column> columns;
  if (columnsJson != null) {
    columns = new List();
    for (int i = 0; i < columnsJson.length; i++) {
      var column = Column.fromJson(columnsJson[i]);
      columns.add(column);
    }
  }
  return new Data(res['has_more'], res['last_key'],
      new NewsListBean(bannerList, feedList, columns));
}

List<NewsBean> bindNewsList(String key, var res) {
  //json数据绑定
  var feeds = res[key];
  if (feeds == null) return null;
  List<NewsBean> feedList = new List();
  for (int i = 0; i < feeds.length; i++) {
    feedList.add(NewsBean.fromJson(feeds[i]));
  }
  return feedList;
}
