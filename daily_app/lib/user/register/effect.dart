import 'package:daily_app/common/common_action.dart';
import 'package:daily_app/component/button/action.dart';
import 'package:daily_app/component/button/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/textfield/state.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    CommonAction.buttonEnableNotify: _onAction,
    CommonAction.loginSuccessAction: _loginSuccessAction,
    RegisterAction.userAgreementAction: _userAgreementAction,
    RegisterAction.pushLoginAction: _pushLoginAction,
  });
}

void _onAction(Action action, Context<RegisterState> ctx) {
  ButtonState buttonState = ctx.state[ComponentKey.button];
  TextFieldState codeState = ctx.state[ComponentKey.code];
  TextFieldState textFieldState = ctx.state[ComponentKey.textField];
  if (buttonState.isEnable != (codeState.enable && textFieldState.enable)) {
    ctx.dispatch(ButtonActionCreator.enableAction(
        codeState.enable && textFieldState.enable));
  }
}

void _userAgreementAction(Action action, Context<RegisterState> ctx) {
  appPush('webview', ctx.context,
      params: {'url': 'http://www.baidu.com', 'title': '用户协议'});
}

void _pushLoginAction(Action action, Context<RegisterState> ctx) {
  appPush('login', ctx.context);
}

void _loginSuccessAction(Action action, Context<RegisterState> ctx) {
  println('_loginSuccessAction');
  Navigator.pop(ctx.context);
}
