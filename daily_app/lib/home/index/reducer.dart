import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/home/index/column/effect.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'adapter/news_state.dart';
import 'banner/banner_state.dart';
import 'column/column_state.dart';
import 'state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.refreshDataAction: _refreshDataAction,
      IndexAction.loadDataAction: _loadDataAction,
    },
  );
}

IndexState _refreshDataAction(IndexState state, Action action) {
  final IndexState newState = state.clone()..data = action.payload;
//  newState.bannerState =
//      initBannerState(newState.data.newsListBean.banners, state.appTheme);
  newState.list = new List();
  newState.list.add(initBannerItemState(newState.data.newsListBean.banners));
  buildData(newState);
  return newState;
}

///这里因为栏目数据是不是在一个列表里面所以要遍历栏目数据和它所在的位置相等后初始化一个item传入column数据,相当于占了一个位置，真正请求栏目(column)数据的是在 [buildEffect]
void buildData(IndexState newState) {
  var columns = newState.data.newsListBean.columns;
  if (columns != null && columns.length > 0) {
    for (int i = 0; i < newState.data.newsListBean.feeds.length; i++) {
      columns.forEach((col) {
        if (i == col.location) {
          var name = col.name;
          println("buildData----------------$i====================$name");
          newState.list.add(
              initColumnItemState(new ColumnData(true, 1, i, col, null, 0)));
        }
      });
      newState.list.add(initNewsItemState(newState.data.newsListBean.feeds[i]));
    }
  } else {
    newState.data.newsListBean.feeds.forEach((bean) {
      newState.list.add(initNewsItemState(bean));
    });
  }
}

IndexState _loadDataAction(IndexState state, Action action) {
  final IndexState newState = state.clone()..data = action.payload;
  buildData(newState);
  return newState;
}
