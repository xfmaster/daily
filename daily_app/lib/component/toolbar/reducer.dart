import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ToolBarState> buildReducer() {
  return asReducer(
    <Object, Reducer<ToolBarState>>{
    },
  );
}

ToolBarState _onAction(ToolBarState state, Action action) {
  final ToolBarState newState = state.clone();
  return newState;
}
