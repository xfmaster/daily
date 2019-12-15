import 'package:daily_app/home/labs/topic/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Effect<TopicItemState> buildEffect() {
  return combineEffects(<Object, Effect<TopicItemState>>{
    TopicAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TopicItemState> ctx) {
}
