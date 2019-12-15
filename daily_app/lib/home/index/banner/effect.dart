import 'package:daily_app/home/index/banner/banner_state.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Effect<BannerItemState> buildEffect() {
  return combineEffects(<Object, Effect<BannerItemState>>{
    BannerAction.onTapAction: _onTapAction,
  });
}

void _onTapAction(Action action, Context<BannerItemState> ctx) {
  int index = action.payload;
  appPush("webview", ctx.context, params: {
    "url": ctx.state.bean[index].post.appview,
    'type': ctx.state.bean[index].post.pageStyle,
    "id": ctx.state.bean[index].post.id,
    "comment": ctx.state.bean[index].post.comment_count,
    "collect": ctx.state.bean[index].post.praise_count,
  });
}
