import 'package:daily_app/component/base_component_state.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:fish_redux/fish_redux.dart';

class ButtonState with BaseComponentState implements Cloneable<ButtonState> {
  String text;
  bool isEnable;

  @override
  ButtonState clone() {
    return ButtonState()
      ..text = text
      ..isEnable = isEnable
      ..isInit = isInit;
  }
}

ButtonState initButtonState(MapLike args) {
  ButtonState buttonState = args[ComponentKey.button] ??= new ButtonState();
  buttonState.text ??= '登录';
  buttonState.isEnable ??= false;
  buttonState.isInit = true;
  return buttonState;
}

class ButtonStateConnOp<T extends MapLike, P> extends ConnOp<T, P> {
  final String key;
  final P Function(T state) init;

  ButtonStateConnOp({this.init, String key}) : key = key ?? ('');

  @override
  P get(T state) {
    return state.containsKey(key) ? state[key] : (state[key] = init(state));
  }

  @override
  void set(T state, P subState) {
    state[key] = subState;
  }
}
