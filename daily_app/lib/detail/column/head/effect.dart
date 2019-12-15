import 'package:daily_app/detail/column/head/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Effect<ColumnHeadState> buildEffect() {
  return combineEffects(<Object, Effect<ColumnHeadState>>{
    HeadAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ColumnHeadState> ctx) {
}
