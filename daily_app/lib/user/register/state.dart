import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/component/appbar/state.dart';
import 'package:daily_app/component/button/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/password/state.dart';
import 'package:daily_app/component/textfield/state.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

class RegisterState
    with MapLike, GlobalBaseState
    implements Cloneable<RegisterState> {
  bool isCheck;

  @override
  RegisterState clone() {
    return RegisterState()
      ..appTheme = appTheme
      ..[ComponentKey.appBar] = this[ComponentKey.appBar]
      ..[ComponentKey.button] = this[ComponentKey.button]
      ..[ComponentKey.code] = this[ComponentKey.code]
      ..[ComponentKey.textField] = this[ComponentKey.textField]
      ..isCheck = isCheck;
  }

  @override
  AppTheme appTheme;
}

RegisterState initState(Map<String, dynamic> args) {
  AppBarState appBarState = new AppBarState();
  appBarState.backgroundColor = AppTheme.getInstance().bodyBackColor;
  appBarState.title = '注册新账号';
  appBarState.actionType = 0;

  TextFieldState textFieldState = new TextFieldState();
  textFieldState.hintText = '手机号码(+86)';
  textFieldState.enable = false;

  TextFieldState codeTextFieldState = new TextFieldState();
  codeTextFieldState.hintText = '验证码';
  codeTextFieldState.enable = false;
  codeTextFieldState.hasVerification = true;

  ButtonState buttonState = new ButtonState();
  buttonState.text = '下一步';
  return RegisterState()
    ..[ComponentKey.appBar] = appBarState
    ..[ComponentKey.button] = buttonState
    ..isCheck = true
    ..[ComponentKey.code] = codeTextFieldState
    ..[ComponentKey.textField] = textFieldState;
}
