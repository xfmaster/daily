import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ButtonState> buildEffect() {
  return combineEffects(<Object, Effect<ButtonState>>{
  });
}

void _onAction(Action action, Context<ButtonState> ctx) {
}
