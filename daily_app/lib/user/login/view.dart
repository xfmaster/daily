import 'package:daily_app/base/basic.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return PlatformScaffold(
    appBar: viewService.buildComponent('appBar'),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/icon_qdaily_logo.png',
            width: 100,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: viewService.buildComponent('textField'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: viewService.buildComponent('password'),
          ),
          SizedBox(
            height: 60,
          ),
          viewService.buildComponent('btn'),
        ],
      ),
    ),
  );
}
