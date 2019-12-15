import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/component/button/state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

class SubscribeState
    with MapLike, GlobalBaseState
    implements Cloneable<SubscribeState> {
  @override
  SubscribeState clone() {
    return SubscribeState()
      ..appTheme = appTheme
      ..[ComponentKey.button] = this[ComponentKey.button];
  }

  @override
  AppTheme appTheme;
}

SubscribeState initState(Map<String, dynamic> args) {
  ButtonState buttonState = new ButtonState();
  buttonState.text = '现在登陆';
  buttonState.isEnable = true;
  return SubscribeState()..[ComponentKey.button] = buttonState;
}
