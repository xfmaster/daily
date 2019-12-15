import 'package:daily_app/detail/column/head/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Reducer<ColumnHeadState> buildReducer() {
  return asReducer(
    <Object, Reducer<ColumnHeadState>>{
      HeadAction.action: _onAction,
    },
  );
}

ColumnHeadState _onAction(ColumnHeadState state, Action action) {
  final ColumnHeadState newState = state.clone();
  return newState;
}
