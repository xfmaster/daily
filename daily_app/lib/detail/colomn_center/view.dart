import 'package:daily_app/base/basic.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ColumnCenterState state, Dispatch dispatch, ViewService viewService) {
  AppBarState appBarState = state[ComponentKey.appBar];
  return DefaultTabController(
    length: appBarState.tabs.length,
    child: PlatformScaffold(
        appBar: viewService.buildComponent('appBar'),
        body: TabBarView(
          controller: state.controller,
          children: <Widget>[
            routes.buildPage('subscribePage', null),
            routes.buildPage('allColumn', null),
          ],
        )),
  );
}
