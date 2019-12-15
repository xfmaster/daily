import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AllColumnItemState> buildEffect() {
  return combineEffects(<Object, Effect<AllColumnItemState>>{
    AllColumnAction.onItemClickAction: _onItemClickAction,
  });
}

void _onItemClickAction(Action action, Context<AllColumnItemState> ctx) {
  Column column = action.payload;
  if (ctx.state.column.id == column.id) {
    appPush("column", ctx.context, params: {
      "title": column.name,
      "id": column.id,
    });
  }
}
