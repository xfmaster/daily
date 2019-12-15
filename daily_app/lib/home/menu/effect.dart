import 'package:daily_app/bean/category.dart';
import 'package:daily_app/global_store/action.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:daily_app/global_store/store.dart';
import 'package:daily_app/home/index/action.dart';
import 'package:daily_app/home/labs/action.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

AnimationController _translateController;
CurvedAnimation _curve;
AnimationStatusListener _listener;

Effect<MenuState> buildEffect() {
  return combineEffects(<Object, Effect<MenuState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    MenuAction.closeMenuAction: _close,
    MenuAction.menuItemClick: _menuItemClick,
    MenuAction.onCategoryItemClick: _onCategoryItemClick,
  });
}

void _menuItemClick(Action action, Context<MenuState> ctx) {
  String text = action.payload;
  switch (text) {
    case "设置":
      break;
    case "夜间":
    case "白天":
      _changeTheme(ctx);

      ///这里强制刷新一下首页当前两个列表，不然当前页的主题不会改变,应该还有更好的办法暂时没找到
      ctx.broadcast(LabsActionCreator.refreshAction());
      ctx.broadcast(IndexActionCreator.refreshAction());
      break;
    case "离线":
      break;
    case "推荐":
      break;
    case "关于我们":
      break;
    case "新闻分类":
      _categoriesAction(ctx);
      break;
    case "栏目中心":
      appPush('columnCenter', ctx.context);
      break;
    case "我的消息":
      break;
    case "个人中心":
      break;
    case "意见反馈":
      break;
  }
}

void _changeTheme(Context<MenuState> ctx) {
  println("_changeTheme");
  GlobalStore.store.dispatch(
      GlobalActionCreator.onchangeThemeColor(!ctx.state.appTheme.dark));
}

void _onCategoryItemClick(Action action, Context<MenuState> ctx) {
  var category = ctx.state.list[action.payload];
  appPush("column", ctx.context, params: {
    "title": category.title,
    "id": category.id,
    'isAnim': false,
    'hideAction': true,
    'api': API_COLUMN_CATEGORY
  });
}

void _categoriesAction(Context<MenuState> ctx) {
  ctx.dispatch(MenuActionCreator.selectIndex(1));
  TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  _translateController = AnimationController(
      vsync: tickerProvider, duration: const Duration(milliseconds: 500));
  _curve =
      CurvedAnimation(parent: _translateController, curve: Curves.easeOutBack);

  ///这里增加动画回弹效果
  ctx.state.bottomAnimation =
      Tween(begin: Offset(0, 0), end: Offset(-1, 0)).animate(_curve);
  ctx.state.columnAnimation =
      Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(_curve);
  _translateController.forward();
}

void _dispose(Action action, Context<MenuState> ctx) {
  if (_translateController != null) {
    _translateController.removeStatusListener(_listener);
    _translateController.dispose();
    _translateController = null;
    _listener = null;
  }
  _curve = null;
}

void _init(Action action, Context<MenuState> ctx) {
  TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  _translateController = AnimationController(
      vsync: tickerProvider, duration: const Duration(milliseconds: 500));
  _curve =
      CurvedAnimation(parent: _translateController, curve: Curves.easeOutBack);
  ctx.state.columnAnimation =
      Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(_curve);

  ///这里增加动画回弹效果
  ctx.state.bottomAnimation =
      Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(_curve);

  ctx.state.topAnimation =
      Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(_curve);

  _translateController.forward();
  getCategories(ctx);
}

///获取新闻分类
void getCategories(Context<MenuState> ctx) {
  requestGet(API_CATEGORIES).then((result) {
    if (result == null || result.length == 0) return;
    List<Category> list = new List();
    for (int i = 0; i < result.length; i++) {
      var category = Category.fromJson(result[i]);
      list.add(category);
    }
    ctx.dispatch(MenuActionCreator.updateCategory(list));
  });
}

void _close(Action action, Context<MenuState> ctx) {
  if (_translateController != null) {
    _translateController.removeStatusListener(_listener);
    _translateController.dispose();
    _translateController = null;
    _listener = null;
  }
  if (ctx.state.selectIndex == 0) {
    //退出menu
    TickerProvider tickerProvider = ctx.stfState as TickerProvider;
    _translateController = AnimationController(
        vsync: tickerProvider, duration: const Duration(milliseconds: 300));
    ctx.dispatch(MenuActionCreator.changeAction());
    _curve = CurvedAnimation(
        parent: _translateController, curve: Curves.easeInOutQuad);

    ///这里增加动画回弹效果
    ctx.state.bottomAnimation =
        Tween(begin: Offset(0, 0), end: Offset(0, 1.4)).animate(_curve);
    ctx.state.topAnimation =
        Tween(begin: Offset(0, 0), end: Offset(0, -1.4)).animate(_curve);
    _listener = (status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(ctx.context);
      }
    };
    _translateController.addStatusListener(_listener);
    _translateController.forward();
  } else {
    //退出新闻分类
    ctx.dispatch(MenuActionCreator.changeAction());
    TickerProvider tickerProvider = ctx.stfState as TickerProvider;
    _translateController = AnimationController(
        vsync: tickerProvider, duration: const Duration(milliseconds: 400));
    _curve = CurvedAnimation(
        parent: _translateController, curve: Curves.easeOutBack);
    _listener = (status) {
      if (status == AnimationStatus.completed) {
        ctx.dispatch(MenuActionCreator.selectIndex(0));
      }
    };
    _translateController.addStatusListener(_listener);

    ///这里增加动画回弹效果
    ctx.state.bottomAnimation =
        Tween(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_curve);
    ctx.state.columnAnimation =
        Tween(begin: Offset(0, 0), end: Offset(1, 0)).animate(_curve);
    _translateController.forward();
  }
}
