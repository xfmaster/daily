import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Effect<NewsItemState> buildEffect() {
  return combineEffects(<Object, Effect<NewsItemState>>{
    ItemAction.itemAction: _itemAction,
  });
}

void _itemAction(Action action, Context<NewsItemState> ctx) {
  NewsItemState itemState = action.payload;
  if (itemState.bean.post.id == ctx.state.bean.post.id) {
    appPush("webview", ctx.context, params: {
      "url": ctx.state.bean.post.appview,
      "type": ctx.state.bean.post.pageStyle,
      "id": ctx.state.bean.post.id,
      "comment": ctx.state.bean.post.comment_count,
      "collect": ctx.state.bean.post.praise_count,
    });
  }
}
