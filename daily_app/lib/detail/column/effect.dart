import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ColumnState> buildEffect() {
  return combineEffects(<Object, Effect<ColumnState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    ColumnAction.loadMoreAction: _loadMore,
  });
}

void _init(Action action, Context<ColumnState> ctx) {
  var id = ctx.state.id;
  if (ctx.state.appbarAnim)
    requestGet(API_COLUMN_PAGE + "$id.json").then((res) {
      if (res['error'] == 400) return;
      var column = Column.fromJson(res['column']);
      ctx.dispatch(ColumnActionCreator.updateColumnTop(column));
    });
  requestGet(ctx.state.api + "$id/0.json").then((res) {
    if (res['error'] == 400) return;
    ctx.dispatch(ColumnActionCreator.updateListAction(bundleData(res, false)));
  });
  if (ctx.state.appbarAnim)
    ctx.state.scrollController.addListener(() {
      var offset = ctx.state.scrollController.position.pixels;
      if (offset < 255) {
        int alpha = (offset).toInt();
        ctx.dispatch(ColumnActionCreator.changeAppbarAlpha(alpha));
      }
    });
}

void _dispose(Action action, Context<ColumnState> ctx) {
  ctx.state.scrollController.dispose();
}

void _loadMore(Action action, Context<ColumnState> ctx) {
  var id = ctx.state.id;
  var last_key = ctx.state.columnList.last_key;
  if (ctx.state.columnList.has_more) {
    requestGet(ctx.state.api + "$id/$last_key.json").then((res) {
      ctx.state.controller.loadComplete();
      if (res['error'] == 400) return;
      ctx.dispatch(ColumnActionCreator.updateListAction(bundleData(res, true)));
    });
  } else {
    ctx.state.controller.loadNoData();
  }
}

ColumnList bundleData(var res, bool isLoad) {
  var feedsJsonArray = res['feeds'];
  List<NewsBean> list = new List();
  for (int i = 0; i < feedsJsonArray.length; i++) {
    var newsBean = NewsBean.fromJson(feedsJsonArray[i]);
    list.add(newsBean);
  }
  return new ColumnList(res['has_more'], res['last_key'], list, isLoad: isLoad);
}
