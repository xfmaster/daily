import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Effect<NewsItemState> buildEffect() {
  return combineEffects(<Object, Effect<NewsItemState>>{
    StudyAction.onItemClickAction: _onItemClickAction,
  });
}

void _onItemClickAction(Action action, Context<NewsItemState> ctx) {
  NewsBean bean = action.payload;
  println(bean.post.id);
  println(ctx.state.bean.post.id);
  if (ctx.state.bean.post.id == bean.post.id&&bean.post.genre==1001) {
    appPush("question", ctx.context, params: {"id": bean.post.id});
  }
}
