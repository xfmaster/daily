import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ButtonState> buildReducer() {
  return asReducer(
    <Object, Reducer<ButtonState>>{ButtonAction.enableAction: _enableAction},
  );
}

ButtonState _enableAction(ButtonState state, Action action) {
  final ButtonState newState = state.clone();
  newState.isEnable = action.payload;
  var isEnable = newState.isEnable;
  println('ButtonState isEnable=$isEnable');
  return newState;
}
