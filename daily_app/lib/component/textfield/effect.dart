import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<TextFieldState> buildEffect() {
  return combineEffects(<Object, Effect<TextFieldState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<TextFieldState> ctx) {
  println("init");
}

void _dispose(Action action, Context<TextFieldState> ctx) {
  if (ctx.state.textEditingController != null)
    ctx.state.textEditingController.dispose();
}
