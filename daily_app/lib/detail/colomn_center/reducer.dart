import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ColumnCenterState> buildReducer() {
  return asReducer(
    <Object, Reducer<ColumnCenterState>>{
      ColumnCenterAction.action: _onAction,
    },
  );
}

ColumnCenterState _onAction(ColumnCenterState state, Action action) {
  final ColumnCenterState newState = state.clone();
  return newState;
}
