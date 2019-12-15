import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/component/button/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/password/state.dart';
import 'package:daily_app/component/textfield/state.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState
    with MapLike, GlobalBaseState
    implements Cloneable<LoginState> {
  @override
  LoginState clone() {
    println('LoginState clone');
    var loginState = LoginState();
    return loginState
      ..appTheme = appTheme
      ..[ComponentKey.appBar] = this[ComponentKey.appBar]
      ..[ComponentKey.button] = this[ComponentKey.button]
      ..[ComponentKey.passWordField] = this[ComponentKey.passWordField]
      ..[ComponentKey.textField] = this[ComponentKey.textField];
  }

  @override
  AppTheme appTheme;
}

LoginState initState(Map<String, dynamic> args) {
  AppBarState appBarState = new AppBarState();
  appBarState.backgroundColor = AppTheme.getInstance().bodyBackColor;
  appBarState.title = '登录';
  appBarState.actionType = 0;
  TextFieldState textFieldState = new TextFieldState();
  textFieldState.hintText = '手机号码/邮箱';
  textFieldState.enable = false;
  TextEditingController userNameController = new TextEditingController();
  textFieldState.textEditingController = userNameController;

  PasswordState passwordState = new PasswordState();
  passwordState.hintText = '请输入密码';
  passwordState.enable = false;
  TextEditingController passWordController = new TextEditingController();
  passwordState.textEditingController = passWordController;

  ButtonState buttonState = new ButtonState();
  buttonState.text = '登录';
  return LoginState()
    ..[ComponentKey.appBar] = appBarState
    ..[ComponentKey.passWordField] = passwordState
    ..[ComponentKey.button] = buttonState
    ..[ComponentKey.textField] = textFieldState;
}
