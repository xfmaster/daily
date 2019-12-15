import 'package:daily_app/utils/user_util.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SubscribeState state, Dispatch dispatch, ViewService viewService) {
  var user = UserUtil.getInstance().getUser();
  String iconPath = state.appTheme.dark
      ? 'column_mysub_not_login_night.png'
      : 'column_mysub_not_login_day.png';
  return user == null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TitleText('未登录'),
            SizedBox(
              height: 10,
            ),
            SubTitleText('登录后你关注的栏目更新可以在这里查看'),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/$iconPath',
              width: 280,
              height: 280,
            ),
            SizedBox(
              height: 30,
            ),
            viewService.buildComponent('btn')
          ],
        )
      : Container();
}
