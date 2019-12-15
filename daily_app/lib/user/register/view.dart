import 'package:daily_app/base/basic.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RegisterState state, Dispatch dispatch, ViewService viewService) {
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
            child: viewService.buildComponent('code'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.check_circle,
                size: 20,
                color:
                    state.isCheck ? Colors.amber : state.appTheme.subTextColor,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: '我已阅读并同意',
                      style: TextStyle(
                          color: state.appTheme.subTextColor,
                          fontSize: state.appTheme.subTextSize),
                      children: [
                        TextSpan(
                            text: "《用户注册协议》",
                            style: TextStyle(
                                color: state.appTheme.subTextColor,
                                fontSize: state.appTheme.subTextSize),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                dispatch(RegisterActionCreator
                                    .userAgreementAction());
                              }),
                      ]),
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          viewService.buildComponent('btn'),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              dispatch(RegisterActionCreator.pushLoginAction());
            },
            child: TitleText(
              '已有Qdaily账号',
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SubTitleText('第三方账号登录'),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icon_qq_button.png',
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/icon_weibo_button.png',
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/icon_wx_button.png',
                width: 50,
                height: 50,
              ),
            ],
          )
        ],
      ),
    ),
  );
  ;
}
