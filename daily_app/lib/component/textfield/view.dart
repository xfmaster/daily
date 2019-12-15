import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/common/common_action.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux/fish_redux.dart' as prefix0;
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    TextFieldState state, Dispatch dispatch, ViewService viewService) {
  var instance = AppTheme.getInstance();
  return Stack(
    children: <Widget>[
      TextField(
        controller: state.textEditingController,
        cursorColor: Colors.amberAccent,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          if (value.length > 0 && !state.enable) {
            dispatch(TextFieldActionCreator.changeEnableAction(true));
          } else if (value.length == 0 && state.enable) {
            dispatch(TextFieldActionCreator.changeEnableAction(false));
          }
          dispatch(CommonActionCreator.buttonEnableNotifyAction());
        },
        maxLines: 1,
        maxLength: state.hasVerification ?6:null,
        decoration: InputDecoration(
            hoverColor: Colors.amberAccent,
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 0.3, color: instance.subTextColor)),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 0.3, color: instance.subTextColor)),
            border: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 0.3, color: instance.subTextColor)),
            hintText: state.hintText,
            hintMaxLines: 1,
            suffixStyle: TextStyle(
                color: instance.textColor, fontSize: instance.mainTextSize),
            focusColor: Colors.amberAccent,
            labelStyle: TextStyle(
                color: instance.textColor, fontSize: instance.mainTextSize),
            hintStyle: TextStyle(
                color: instance.subTextColor, fontSize: instance.mainTextSize)),
      ),
      Positioned(
        right: 0,
        child: state.hasVerification ? TitleText('发送验证码') : SizedBox(),
        top: 10,
      )
    ],
  );
}
