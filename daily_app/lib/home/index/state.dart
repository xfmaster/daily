import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/base/base_page_state.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IndexState extends BasePageState<BaseItem>
    implements GlobalBaseState, Cloneable<IndexState> {
  NewsListBean bean;
  Data data;
  RefreshController refreshController;
  SliverOverlapAbsorberHandle handle;

  @override
  IndexState clone() {
    ///切换主题的时候会出现当前页面不更新的问题，所以在这里强行把itemsState更新一下就行了
//    if (list != null && appTheme != AppTheme.getInstance()) {
//      for (int i = 0; i < list.length; i++) {
//        list[i] = list[i].clone();
//      }
//      println("index-----clone");
//    }
    return IndexState()
      ..appTheme = appTheme
      ..bean = bean
      ..data = data
      ..refreshController = refreshController
      ..list = list
      ..handle = handle;
  }

  @override
  AppTheme appTheme;

  @override
  MutableSource updateItemData(int index, Object data, bool isStateCopied) {
    isStateCopied = appTheme.dark != AppTheme.getInstance().dark;
    return super.updateItemData(index, data, isStateCopied);
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState()..refreshController = new RefreshController();
}
