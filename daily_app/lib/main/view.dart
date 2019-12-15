import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:daily_app/utils/screen_util.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: state.appTheme.dark ? darkTheme : lightTheme,
    home: routes.buildPage('home', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
