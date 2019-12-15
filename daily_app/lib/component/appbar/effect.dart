import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<AppBarState> buildEffect() {
  return combineEffects(<Object, Effect<AppBarState>>{
    AppBarAction.backAction: _backAction,
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose
  });
}

void _backAction(Action action, Context<AppBarState> ctx) {
  Navigator.pop(ctx.context);
}

void _dispose(Action action, Context<AppBarState> ctx) {
  if (ctx.state.showTabBar) ctx.state.controller.dispose();
}

void _init(Action action, Context<AppBarState> ctx) {
//  if (ctx.state.showTabBar) {
//    TickerProvider tickerProvider = ctx.stfState as prefix0.TickerProvider;
//    ctx.state.controller = new prefix0.TabController(
//        length: ctx.state.tabs.length, vsync: tickerProvider);
//  }
}
