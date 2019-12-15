import 'package:fish_redux/fish_redux.dart';

import 'author_state.dart';
import 'action.dart';

Reducer<AuthorItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthorItemState>>{
      AuthorHeadAction.action: _onAction,
    },
  );
}

AuthorItemState _onAction(AuthorItemState state, Action action) {
  final AuthorItemState newState = state.clone();
  return newState;
}
