import 'package:daily_app/bean/all_column.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AllColumnState> buildEffect() {
  return combineEffects(<Object, Effect<AllColumnState>>{
    Lifecycle.initState: _onAction,
    AllColumnAction.refreshAction: _onAction,
    AllColumnAction.loadMoreAction: _loadMoreAction,
  });
}

void _onAction(Action action, Context<AllColumnState> ctx) {
  requestGet(API_ALL_COLUMN + '0.json').then((result) {
    if (result['error'] == 400) return;
    ctx.dispatch(
        AllColumnActionCreator.updateAllColumn(_bundleData(result, true)));
    ctx.state.refreshController.refreshCompleted();
  });
}

void _loadMoreAction(Action action, Context<AllColumnState> ctx) {
  println(ctx.state.columnData.hasMore);
  if (ctx.state.columnData.hasMore) {
    var lastKey = ctx.state.columnData.lastKey;
    println(lastKey);
    requestGet(API_ALL_COLUMN + '$lastKey.json').then((result) {
      if (result['error'] == 400) return;
      ctx.dispatch(
          AllColumnActionCreator.updateAllColumn(_bundleData(result, false)));
      ctx.state.refreshController.loadComplete();
    });
  }else{
    ctx.state.refreshController.loadNoData();
  }
}

AllColumnData _bundleData(res, bool isRefresh) {
  var jsonArray = res['columns'];
  List<Column> list = new List();
  for (int i = 0; i < jsonArray.length; i++) {
    var column = Column.fromJson(jsonArray[i]);
    list.add(column);
  }
  return AllColumnData(res['last_key'], res['has_more'], list, isRefresh);
}
