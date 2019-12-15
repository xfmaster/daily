import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TextFieldState> buildReducer() {
  return asReducer(
    <Object, Reducer<TextFieldState>>{
      TextFieldAction.changeEnableAction: _changeEnableAction,
    },
  );
}

TextFieldState _changeEnableAction(TextFieldState state, Action action) {
  var payload = action.payload;
  println("_changeEnableAction $payload");
  final TextFieldState newState = state.clone();
  newState.enable = payload;
  var enable = newState.enable;
  println("_changeEnableAction textfield $enable");
  return newState;
}
