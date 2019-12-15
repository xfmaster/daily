import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AppBarState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppBarState>>{
    },
  );
}

AppBarState _onAction(AppBarState state, Action action) {
  final AppBarState newState = state.clone();
  return newState;
}
