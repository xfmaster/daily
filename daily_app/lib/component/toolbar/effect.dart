import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart'hide Action;
import 'action.dart';
import 'state.dart';

Effect<ToolBarState> buildEffect() {
  return combineEffects(<Object, Effect<ToolBarState>>{
    ToolBarAction.backAction: _backAction,
  });
}

void _backAction(Action action, Context<ToolBarState> ctx) {
  println("_backAction");
  Navigator.pop(ctx.context);
}
