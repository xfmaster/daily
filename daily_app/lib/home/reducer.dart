import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.hideButtonAction: _hideButtonAction,
    },
  );
}


HomeState _hideButtonAction(HomeState state, Action action) {
  final HomeState newState = state.clone()..hide = action.payload;
  println(newState.hide);
  return newState;
}
