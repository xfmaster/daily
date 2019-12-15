import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/home/index/column/column_state.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';

import '../effect.dart';
import 'action.dart';

Effect<ColumnItemState> buildEffect() {
  return combineEffects(<Object, Effect<ColumnItemState>>{
    ColumnAction.loadColumnAction: _loadColumnAction,
    ColumnAction.columnItemClick: _columnItemClick,
    ColumnAction.columnClick: _columnClick,
    Lifecycle.initState: _init,
  });
}

void _columnItemClick(Action action, Context<ColumnItemState> ctx) {
  int index = action.payload;
  var bean = ctx.state.bean.list[index];
  println("_columnItemClick");
  appPush("webview", ctx.context, params: {
    "url": bean.post.appview,
    "type": bean.post.pageStyle,
    "id": bean.post.id,
    "comment": bean.post.comment_count,
    "collect": bean.post.praise_count,
  });
}

void _columnClick(Action action, Context<ColumnItemState> ctx) {
  int id = action.payload;
  if (id == ctx.state.bean.column.id) {
    appPush("column", ctx.context, params: {
      "title": ctx.state.bean.column.name,
      "id": ctx.state.bean.column.id,
    });
  }
}

///加载更多栏目数据
void _loadColumnAction(Action action, Context<ColumnItemState> ctx) {
  ColumnData data = action.payload;
  if (data.column.id == ctx.state.bean.column.id) {
    var column = data.column;
    var id = column.id;
    var last_key = data.last_key;
    if (data.has_more) {
      requestGet(API_COLUMN + "$id/$last_key.json").then((res) {
        if (res['error'] == 400) return;
        var newsList = bindNewsList("feeds", res);
        println("_loadColumnAction ================effect");
        var columnData = new ColumnData(res['has_more'], res['last_key'],
            column.location, column, newsList, itemWidth);
        ctx.dispatch(ColumnActionCreator.loadColumnData(columnData));
        ctx.state.refreshController.loadComplete();
      });
    }
  }
}

void _init(Action action, Context<ColumnItemState> ctx) {
  //这里才是栏目数据初始化获取
  var column = ctx.state.bean.column;
  var name = column.name;
  println("_init---------------------------------------------$name");
  _getColumnData(ctx);
}

void _getColumnData(Context<ColumnItemState> ctx) {
  var column = ctx.state.bean.column;
  var name = column.name;

  var id = column.id;
  var location = column.location;
  requestGet(API_COLUMN + "$id/0.json").then((res) {
    if (res['error'] == 400) return;
    var newsList = bindNewsList("feeds", res);
    var columnData = new ColumnData(res['has_more'], res['last_key'], location,
        column, newsList, itemWidth);
    println("_getColumnData=====================$name");
    ctx.dispatch(ColumnActionCreator.columnData(columnData));
  });
}
