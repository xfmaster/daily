import 'package:daily_app/detail/colomn_center/all/page.dart';
import 'package:daily_app/detail/colomn_center/page.dart';
import 'package:daily_app/detail/colomn_center/subscribe/page.dart';
import 'package:daily_app/detail/column/page.dart';
import 'package:daily_app/detail/question/page.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:daily_app/global_store/store.dart';
import 'package:daily_app/home/index/page.dart';
import 'package:daily_app/home/labs/page.dart';
import 'package:daily_app/home/menu/page.dart';
import 'package:daily_app/home/page.dart';
import 'package:daily_app/main/page.dart';
import 'package:daily_app/user/author/page.dart';
import 'package:daily_app/user/login/page.dart';
import 'package:daily_app/user/register/page.dart';
import 'package:daily_app/web/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final AbstractRoutes routes = PageRoutes(
  pages: <String, Page<Object, dynamic>>{
    /// 主页面
    'main': MainPage(),

    ///首页
    'home': HomePage(),
    'index': IndexPage(),

    ///首页labs
    'labs': LabsPage(),

    ///新闻详情页
    'webview': WebPage(),

    ///菜单页
    'menu': MenuPage(),

    ///弹幕页
    'question': QuestionPage(),

    ///栏目列表页
    'column': ColumnPage(),

    ///栏目中心
    'columnCenter': ColumnCenterPage(),

    ///我的订阅
    'subscribePage': SubscribePage(),

    ///全部栏目
    'allColumn': AllColumnPage(),

    ///登录
    'login': LoginPage(),

    ///注册新账号
    'register': RegisterPage(),

    ///作者主页
    'author': AuthorHomePage(),
  },
  visitor: (String path, Page<Object, dynamic> page) {
    /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
    /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
    if (page.isTypeof<GlobalBaseState>()) {
      page.connectExtraStore<GlobalState>(GlobalStore.store,
          // ignore: missing_return
          (Object pageState, GlobalState appState) {
        final GlobalBaseState p = pageState;
        if (p.appTheme != null && p.appTheme.dark == appState.appTheme.dark) {
          return pageState;
        } else {
          if (pageState is Cloneable) {
            final Object copy = pageState.clone();
            final GlobalBaseState newState = copy;
            newState.appTheme = appState.appTheme;
            return newState;
          }
        }
      });
    }

    /// AOP
    /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
    /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
    page.enhancer.append(
      /// View AOP
      viewMiddleware: <ViewMiddleware<dynamic>>[
        safetyView<dynamic>(),
      ],

      /// Adapter AOP
      adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],

      /// Effect AOP
      effectMiddleware: <EffectMiddleware<dynamic>>[],

      /// Store AOP
      middleware: <Middleware<dynamic>>[
        logMiddleware<dynamic>(tag: page.runtimeType.toString()),
      ],
    );
  },
);

Future appPushRemoveRoute(String path, BuildContext context,
    {Map<String, dynamic> params}) async {
  return await Navigator.of(context).pushAndRemoveUntil(
      new PageRouteBuilder(pageBuilder: (BuildContext context,
          Animation<double> animation, Animation<double> secondaryAnimation) {
        // 跳转的路由对象
        return routes.buildPage(path, params);
      }, transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return createTransition(animation, child);
      }),
      ModalRoute.withName(path));
}

Future appPush(String path, BuildContext context,
    {Map<String, dynamic> params}) async {
  return await Navigator.push(
      context,
      new PageRouteBuilder(pageBuilder: (BuildContext context,
          Animation<double> animation, Animation<double> secondaryAnimation) {
        // 跳转的路由对象
        return routes.buildPage(path, params);
      }, transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return createTransition(animation, child);
      }));
}

Future appPushName(String path, BuildContext context) async {
  return await Navigator.of(context).pushNamed(path);
}

SlideTransition createTransition(Animation<double> animation, Widget child) {
  return new SlideTransition(
    position: new Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(animation),
    child: child,
  );
}
