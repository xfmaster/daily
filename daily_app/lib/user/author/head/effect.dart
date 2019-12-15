import 'package:daily_app/user/author/head/author_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Effect<AuthorItemState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorItemState>>{
    AuthorHeadAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AuthorItemState> ctx) {}
