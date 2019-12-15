import 'dart:ui';

import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/base/basic.dart';
import 'package:daily_app/common/icons.dart';
import 'package:daily_app/utils/screen_util.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AppBarState state, Dispatch dispatch, ViewService viewService) {
  var showTabBar = state.showTabBar;
  println("build $showTabBar");
  return PlatformAppBar(
    centerTitle: true,
    backgroundColor: state.backgroundColor,
    leading: GestureDetector(
      onTap: () {
        dispatch(AppBarActionCreator.backAction());
      },
      child: Icon(
        MyIcons.back,
        color: state.textColor,
        size: 30,
      ),
    ),
    title: TitleText(
      state.title,
      color: state.textColor,
    ),
    action: state.actionType == 1
        ? Icon(
            state.iconData,
            color: state.textColor,
          )
        : SizedBox(),
    tabBar: (state.showTabBar != null && state.showTabBar)
        ? TabBar(
            controller: state.controller,
            tabs: state.tabs,
            indicatorColor: Colors.amberAccent,
            indicatorSize: TabBarIndicatorSize.label,
          )
        : null,
  );
//  return Container(
//    color: state.backgroundColor,
//    width: ScreenUtils.width ??= 360,
//    padding: EdgeInsets.only(top: top),
//    height: 48 + top,
//    child: Row(
//      mainAxisSize: MainAxisSize.max,
//      children: <Widget>[
//        SizedBox(
//          width: 10,
//        ),
//        GestureDetector(
//          onTap: () {
//            dispatch(AppBarActionCreator.backAction());
//          },
//          child: Icon(
//            MyIcons.back,
//            color: state.textColor,
//            size: 30,
//          ),
//        ),
//        Expanded(
//          child: Center(
//            child: TitleText(
//              state.title,
//              color: state.textColor,
//            ),
//          ),
//        ),
//        state.actionType == 1
//            ? Icon(
//                state.iconData,
//                color: state.textColor,
//              )
//            : SizedBox(),
//        SizedBox(
//          width: 10,
//        )
//      ],
//    ),
//  );
}
