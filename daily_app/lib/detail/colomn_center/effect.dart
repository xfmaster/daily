import 'package:daily_app/component/appbar/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as prefix0 hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<ColumnCenterState> buildEffect() {
  return combineEffects(
      <Object, Effect<ColumnCenterState>>{Lifecycle.initState: _init});
}

void _init(Action action, Context<ColumnCenterState> ctx) {
  TickerProvider tickerProvider = ctx.stfState as prefix0.TickerProvider;
  ctx.state.controller =
      new prefix0.TabController(length: 2, vsync: tickerProvider);
  (ctx.state['appbar'] as AppBarState).controller = ctx.state.controller;
}
