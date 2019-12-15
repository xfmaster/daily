import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor }

class GlobalActionCreator {
  static Action onchangeThemeColor(bool action) {
    return Action(GlobalAction.changeThemeColor, payload: action);
  }
}
