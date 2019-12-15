import 'package:daily_app/bean/author.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<AuthorHomeState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorHomeState>>{
    Lifecycle.initState: _init,
    AuthorHomeAction.loadMoreAction: _loadMoreAction,
    AuthorHomeAction.backAction: _backAction,
  });
}

void _init(Action action, Context<AuthorHomeState> ctx) {
  var id = ctx.state.id;
  requestGet(API_USER_HOME + '$id/0.json').then((res) {
    if (res['error'] == 400) return;
    ctx.dispatch(
        AuthorHomeActionCreator.updateDataAction(bundleData(res, true)));
  });
  ctx.state.scrollController.addListener(() {
    var offset = ctx.state.scrollController.position.pixels;
    if (offset > 100 && !ctx.state.isVisible) {
      ctx.dispatch(AuthorHomeActionCreator.updateTitleVisible(true));
    } else if (offset <= 100 && ctx.state.isVisible) {
      ctx.dispatch(AuthorHomeActionCreator.updateTitleVisible(false));
    }
    if (offset < 150) {
      int alpha = (offset * (255 / 150)).toInt();
      ctx.dispatch(AuthorHomeActionCreator.changeAppbarAlpha(alpha));
    }
    if (ctx.state.backColor.alpha < 255 && offset > 150) {
      ctx.dispatch(AuthorHomeActionCreator.changeAppbarAlpha(255));
    }
  });
}

void _loadMoreAction(Action action, Context<AuthorHomeState> ctx) {
  var id = ctx.state.id;
  var lastKey = ctx.state.authorBean.lastKey;
  if (ctx.state.authorBean.hasMore) {
    requestGet(API_USER_HOME + '$id/$lastKey.json').then((res) {
      if (res['error'] == 400) return;
      ctx.dispatch(
          AuthorHomeActionCreator.updateDataAction(bundleData(res, false)));
      ctx.state.refreshController.loadComplete();
    });
  } else {
    ctx.state.refreshController.loadNoData();
  }
}

void _backAction(Action action, Context<AuthorHomeState> ctx) {
  Navigator.pop(ctx.context);
}

AuthorBean bundleData(var res, bool isRefresh) {
  var feedsJsonArray = res['feeds'];
  var author = Author.fromJson(res['author']);
  List<NewsBean> list = new List();
  for (int i = 0; i < feedsJsonArray.length; i++) {
    var newsBean = NewsBean.fromJson(feedsJsonArray[i]);
    list.add(newsBean);
  }
  return new AuthorBean(
      res['last_key'], res['has_more'], list, author, isRefresh);
}
