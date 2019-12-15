import 'dart:math';

import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ButtonAction { onClickAction, enableAction }

class ButtonActionCreator {
  static Action onClickAction() {
    return const Action(ButtonAction.onClickAction);
  }

  static Action enableAction(bool enable) {
    return Action(ButtonAction.enableAction, payload: enable);
  }
}
