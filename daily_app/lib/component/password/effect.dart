import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PasswordState> buildEffect() {
  return combineEffects(<Object, Effect<PasswordState>>{
    Lifecycle.dispose: _dispose,
  });
}

void _dispose(Action action, Context<PasswordState> ctx) {
  if (ctx.state.textEditingController != null)
    ctx.state.textEditingController.dispose();
}
