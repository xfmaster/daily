import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/global_store/action.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:daily_app/utils/screen_util.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/cupertino.dart' as prefix1;
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter/widgets.dart' as prefix2;
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.changeThemeAction: _changeThemeEffect,
    HomeAction.showMenuAction: _showMenu,
    Lifecycle.initState: _init,
    Lifecycle.build: _build,
  });
}
void _build(Action action, Context<HomeState> ctx) {
  var size = MediaQuery.of(ctx.context).size;
  ScreenUtils.width = size.width;
  ScreenUtils.height = size.height;
  var width = size.width;
  println("create-------------------$width");
}

void _init(Action action, Context<HomeState> ctx) {
  TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  ctx.state.tabController =
      new prefix0.TabController(length: 2, vsync: tickerProvider);

  ctx.state.controller.addListener(() {
    var pixels = ctx.state.controller.position.pixels;
    println("scroll---->$pixels");
    var userScrollDirection = ctx.state.controller.position.userScrollDirection;
    bool isHide = userScrollDirection == ScrollDirection.forward ||
        userScrollDirection == ScrollDirection.idle;
    if (isHide != ctx.state.hide) {
      //防止多次刷新页面
      //判断当前隐藏状态是否前面的状态一致，是的话才先发一个action然后走下面显示延迟
      ctx.dispatch(HomeActionCreator.hideButtonAction(isHide));
      Future.delayed(Duration(seconds: 5), () {
        if (ctx.state.controller.position.userScrollDirection ==
            ScrollDirection.idle) //判断当前是否在滚动，没有在滚动就执行下面的显示action
          ctx.dispatch(HomeActionCreator.hideButtonAction(true));
      });
    }
  });
}

void _changeThemeEffect(Action action, Context<HomeState> ctx) {
  ctx.broadcast(HomeActionCreator.changeThemeAction(action.payload));
}

void _showMenu(Action action, Context<HomeState> ctx) {
  _openFullscreenDialog(ctx.context);
}

void _openFullscreenDialog(prefix1.BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
    return routes.buildPage("menu", null);
  }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return AppTheme.createFadeTransition(animation, child);
  }));
}
