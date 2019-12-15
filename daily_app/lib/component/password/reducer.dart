import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PasswordState> buildReducer() {
  return asReducer(
    <Object, Reducer<PasswordState>>{
      PasswordAction.changeEnableAction: _changeEnableAction,
      PasswordAction.passwordEnableAction: _passwordEnableAction,
    },
  );
}

PasswordState _changeEnableAction(PasswordState state, Action action) {
  final PasswordState newState = state.clone();
  newState.enable = action.payload;
  var enable = newState.enable;
  println("_changeEnableAction $enable");
  return newState;
}

PasswordState _passwordEnableAction(PasswordState state, Action action) {
  final PasswordState newState = state.clone();
  newState.visiblePassword = !newState.visiblePassword;
  return newState;
}
