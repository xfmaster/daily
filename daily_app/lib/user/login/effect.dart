import 'package:daily_app/bean/user.dart';
import 'package:daily_app/common/common_action.dart';
import 'package:daily_app/component/button/action.dart';
import 'package:daily_app/component/button/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/password/state.dart';
import 'package:daily_app/component/textfield/state.dart';
import 'package:daily_app/database/db_manager.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:daily_app/utils/SPUtils.dart';
import 'package:daily_app/utils/user_util.dart';
import 'package:daily_app/view/ui_util.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as prefix0;

import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    CommonAction.buttonEnableNotify: _buttonEnableNotify,
    ButtonAction.onClickAction: _login,
  });
}

void _buttonEnableNotify(Action action, Context<LoginState> ctx) {
  println('_buttonEnableNotify');
  ButtonState buttonState = ctx.state[ComponentKey.button];
  PasswordState passwordState = ctx.state[ComponentKey.passWordField];
  TextFieldState textFieldState = ctx.state[ComponentKey.textField];
  if (buttonState.isEnable != (passwordState.enable && textFieldState.enable)) {
    ctx.dispatch(ButtonActionCreator.enableAction(
        passwordState.enable && textFieldState.enable));
  }
}

void _login(Action action, Context<LoginState> ctx) {
  TextFieldState textFieldState = ctx.state[ComponentKey.textField];
  PasswordState passWordFieldState = ctx.state[ComponentKey.passWordField];
  println(textFieldState.textEditingController.text);
  println(passWordFieldState.textEditingController.text);
  var userName = textFieldState.textEditingController.text;
  var password = passWordFieldState.textEditingController.text;
  if (userName != '' && password != '') {
    UIUtil.showLoadingDialog(ctx.context, text: '正在登陆...');
    String userKey;
    String api;
    if (userName.indexOf('@') == -1) {
      userKey = 'user[phone]';
      api = API_PHONE_LOGIN;
    } else {
      userKey = 'user[email]';
      api = API_EMAIL_LOGIN;
    }
    requestPost(api, params: {userKey: userName, 'user[password]': password})
        .then((res) {
      println(res);
      UIUtil.stopLoadingDialog(ctx.context);
      var user = User.fromJson(res);
      DbManager.getInstance().getUserDao().insertUser(user);
      UserUtil.getInstance().user = user;
      ctx.broadcast(CommonActionCreator.loginSuccessAction());
      prefix0.Navigator.pop(ctx.context);
    });
  }
}
