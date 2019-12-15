import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/common/common_action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PasswordState state, Dispatch dispatch, ViewService viewService) {
  var instance = AppTheme.getInstance();
  return TextField(
    cursorColor: Colors.amberAccent,
    keyboardType: TextInputType.text,
    maxLines: 1,
    obscureText: !state.visiblePassword,
    controller: state.textEditingController,
    onChanged: (value) {
      if (value.length > 0 && !state.enable) {
        dispatch(PasswordActionCreator.changeEnableAction(true));
      } else if (value.length == 0 && state.enable) {
        dispatch(PasswordActionCreator.changeEnableAction(false));
      }
      dispatch(CommonActionCreator.buttonEnableNotifyAction());
    },
    decoration: InputDecoration(
        hoverColor: Colors.amberAccent,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: instance.subTextColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: instance.subTextColor)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.3, color: instance.subTextColor)),
        hintText: state.hintText,
        hintMaxLines: 1,
        suffixIcon: GestureDetector(
          onTap: () {
            dispatch(PasswordActionCreator.passwordEnableAction());
          },
          child: Icon(
            Icons.remove_red_eye,
            color: state.visiblePassword ? Colors.amber : instance.subTextColor,
          ),
        ),
        focusColor: Colors.amberAccent,
        labelStyle: TextStyle(
            color: instance.textColor, fontSize: instance.mainTextSize),
        hintStyle: TextStyle(
            color: instance.subTextColor, fontSize: instance.mainTextSize)),
  );
}
